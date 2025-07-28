-- 1 Llistar productes
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3 
SELECT * FROM producto;
--  4
SELECT nombre, precio, precio * 1.1 AS precio_usd FROM producto;
-- 5
SELECT nombre AS 'nom de producto', precio AS euros, precio * 1.1 AS dòlars FROM producto;
-- 6
SELECT UPPER(nombre), precio FROM producto;
-- 7
SELECT LOWER(nombre), precio FROM producto;
-- 8
SELECT nombre, ROUND(precio) FROM producto;
-- 9
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- 10 Llistar fabricants
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 11
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 12
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;

-- 13 Codis de fabricants amb productes
SELECT codigo_fabricante FROM producto;
-- 14 
SELECT DISTINCT codigo_fabricante FROM producto;

-- 15 Ordenació de productes
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16 LIMITs sobre taula fabricante
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 3, 2;

-- 18 Producte més barat
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19 Producte més car
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20 Productes del fabricant amb codi 2
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21 Producte, preu, fabricant
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22 Amb ordre pel nom del fabricant
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
ORDER BY f.nombre;

-- 23 Totes les dades amb codis
SELECT p.codigo, p.nombre, f.codigo, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24 Més barat amb fabricant
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
ORDER BY p.precio ASC LIMIT 1;

--  25 Més car amb fabricant
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
ORDER BY p.precio DESC LIMIT 1;

-- 26 Productes Lenovo (sense JOIN)
SELECT * FROM producto WHERE codigo_fabricante = (
    SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
);

-- 27 Productes Crucial amb preu > 200
SELECT p.* 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28 Productes Asus, HP, Seagate (sense IN)
SELECT p.* 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29 Amb IN
SELECT p.* 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30 Fab que acaben amb "e"
SELECT p.nombre, p.precio 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre LIKE '%e';

-- 31 Fab amb "w"
SELECT p.nombre, p.precio 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre LIKE '%w%';

-- 32 Productes amb preu ≥ 180 ordenats
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE p.precio >= 180 
ORDER BY p.precio DESC, p.nombre ASC;

-- 33 Fabricants amb productes
SELECT DISTINCT f.codigo, f.nombre 
FROM fabricante f 
JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34 Tots els fabricants i productes (LEFT JOIN)
SELECT f.nombre, p.nombre 
FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35 Fabricants sense productes
SELECT f.nombre 
FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante 
WHERE p.codigo IS NULL;

-- 36 Productes més cars Lenovo (sense JOIN)
SELECT * FROM producto 
WHERE precio = (
    SELECT MAX(precio) FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
    )
);

-- 37 Producte més car Lenovo
SELECT nombre FROM producto 
WHERE precio = (
    SELECT MAX(precio) FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
    )
);

-- 38 Producte més barat HP
SELECT nombre FROM producto 
WHERE precio = (
    SELECT MIN(precio) FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'
    )
);

-- 39 Productes amb preu ≥ al més car Lenovo
SELECT * FROM producto 
WHERE precio >= (
    SELECT MAX(precio) FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
    )
);

-- 40 Productes Asus amb preu > mitjana Asus
SELECT * FROM producto 
WHERE codigo_fabricante = (
    SELECT codigo FROM fabricante WHERE nombre = 'Asus'
) AND precio > (
    SELECT AVG(precio) FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Asus'
    )
);