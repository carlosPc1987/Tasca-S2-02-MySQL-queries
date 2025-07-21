/*
  1-Esta consulta muestra el nombre
  de todos los productos que hay en la base de datos.
*/
select name from product;

/*2-Esta consulta muestra el nombre y el precio
  de todos los productos que hay en la base de datos*/
select name, price from product;

/* 3-Mostra totes les dades (totas les columnes i files)
 de la tabla product*/
select * from product;

/*4-Mostra el nom del producte, preu en euros i 
el preu equivalent en dòlars (USD)*/
select
name as 'Nom del producte',
price as 'Preu (€)',
round(price * 1.10, 2) AS 'Preu (USD)'
from product;

/*5-Mostra el nom del producte, el preu en euros i en dòlars (USD)
 amb àlies personalitzats*/
select 
name as 'nom de producto',
price as 'euros',
round(price * 1.10, 2) as 'dòlars'
from product;

-- 6-Mostra els noms dels productes en majúscules i els seus preus
select 
upper(name) as 'NOM',
price as 'PREU (€)'
from product;

-- 7-Mostra els noms dels productes en minúscula i els seus preus
select 
lower(name) as 'nom (minúscula)',
price as 'preu (€)'
from product;

-- 8-Mostra el nom del fabricant i els dos primers caràcters en majúscula
select 
name as 'Nom del fabricant',
upper(left(name, 2)) as 'Prefix majúscula'
from maker;

-- 9-Mostra els noms dels productes amb el seu preu arrodonit (amb decimals)
select 
name as 'Nom del producte',
round (price,2) as 'Preu arrodonit amb decimals (€)'
from product;

-- 10-Mostra els noms dels productes amb el seu preu arrodonit (sense decimals)
select
name as 'Nom del producte',
round(price) as 'Preu arrodonit sense decimals'
from product;

-- 11-Mostra els codis dels fabricants amb productes, confirmant que existeixen a la taula maker
select distinct m.code 
from maker m
join product p on m.code = p.code_maker;

-- 12-Mostra els codis dels fabricants que tenen productes, sense repeticions
select distinct code_maker 
from product;

-- 13-Mostra els noms dels fabricants ordenats alfabèticament de manera ascendent
select name as 'Nom del fabricant'
from maker
order by name asc;

-- 14-Mostra els noms dels fabricants ordenats de la Z a la A
select name as'Nom del fabricant'
from maker
order by name desc;

-- 15-Mostra els noms dels productes ordenats per nom (asc) i per preu (descendent)
 
select name as 'Nom del producte',
price as 'Preu (€)'
from product
order by name asc, price desc;

-- 16-Retorna una llista amb les 5 primeres files de la taula fabricante.
select *
from maker 
limit 5;

-- 17-Retorna 2 files començant des de la quarta fila (inclosa)
SELECT * 
from maker
limit 3, 2;

-- 18-Mostra el nom i el preu del producte més barat
select name, price
from product
order by price asc
limit 1;

-- 19-Mostra el nom i el preu del producte més car
select name, price
from product
order by price desc
limit 1;

-- 20-Mostra el nom dels productes del fabricant amb codi 2
select name as 'Nom del producte'
from product
where code_maker = 2;

-- 21-Mostra el nom del producte, el seu preu i el nom del fabricant
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code;

-- 22-Mostra el nom del producte, el seu preu i el nom del fabricant, ordenat pel nom del fabricant
select
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
order by m.name asc;

-- 23-Mostra el codi i nom del producte, i el codi i nom del fabricant
select 
p.code as 'Codi del producte',
p.name as 'Nom del producte',
m.code as'Codi del fabricant',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code;

-- 24-Mostra el nom del producte més barat, el seu preu i el nom del fabricant
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
order by p.price asc
limit 1;

-- 25-Mostra el nom del producte més car, el seu preu i el nom del fabricant
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
order by p.price desc
limit 1;

-- 26-Mostra tots els productes del fabricant Lenovo
select
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
where m.name = 'Lenovo';

-- 27-Mostra els productes del fabricant Crucial amb preu superior a 200 €
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
where m.name = 'Crucial' and p.price > 200;

-- 28-Consulta sin usar In
select
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
where m.name = 'Asus' 
or m.name = 'Hewlett-Packard' 
or m.name = 'Seagate';
   
   -- 29-Consulta usando in
select
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
where m.name in ('Asus', 'Hewlett-Packard', 'Seagate');

/*30-Retorna un llistat amb el nom i el preu de tots els productes 
dels fabricants el nom dels quals acabi per la vocal e*/
select
p.name as 'Nom del producte',
p.price as 'Preu (€)'
from product p
join maker m on p.code_maker = m.code
where m.name like '%e';

/*31-Retorna un llistat amb el nom i el preu de tots els productes
 el nom de fabricant dels quals contingui el caràcter w en el seu nom.*/
select
p.name as 'Nom del producte',
p.price as 'Preu (€)'
from product p
join maker m on p.code_maker = m.code
where m.name like '%w%';

/* 32-Retorna un llistat amb el nom de producte, preu i nom de fabricant,
 de tots els productes que tinguin un preu major o igual a 180 €.
 Ordena el resultat, en primer lloc, pel preu -en ordre descendent i, 
 en segon lloc, pel nom -en ordre ascendent.*/
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p
join maker m on p.code_maker = m.code
where p.price >= 180
order by p.price desc, p.name asc;

/* 33-Retorna un llistat amb el codi i el nom de fabricant,
 solament d'aquells fabricants que tenen productes associats en la base de dades*/
select distinct 
m.code as 'Codi del fabricant',
m.name as 'Nom del fabricant'
from maker m
join product p on m.code = p.code_maker;

/* 34-Retorna un llistat de tots els fabricants que existeixen en la base de dades,
 juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també
 aquells fabricants que no tenen productes associats.*/
select 
m.code as 'Codi del fabricant',
m.name as 'Nom del fabricant',
p.name as 'Nom del producte',
p.price as 'Preu (€)'
from maker m
left join product p on m.code = p.code_maker;

-- 35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat
select
m.code as 'Codi del fabricant',
m.name as 'Nom del fabricant'
from maker m
left join product p on m.code = p.code_maker
where p.code is null;

-- 36 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN)
select 
p.name as 'Nom del producte',
p.price as 'Preu (€)',
m.name as 'Nom del fabricant'
from product p, maker m
where p.code_maker = m.code
and m.name = 'Lenovo';
  
/* 37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car
 del fabricant Lenovo. (Sense usar INNER JOIN).*/
select* 
from product 
where price = (select max(price) from product 
where code_maker = (select code from maker where name = 'Lenovo')
);

-- 38-Llista el nom del producte més car del fabricant Lenovo.
select name as 'Nom del producte'
from product
where code_maker = (select code from  maker where name = 'Lenovo')
and price = (select MAX(price)from product
where code_maker = (select code from maker where name = 'Lenovo')
);

-- 39-Llista el nom del producte més barat del fabricant Hewlett-Packard.

select name as'Nom del producte'
from product
where code_maker = (select code from maker where name = 'Hewlett-Packard')
and price = (select min(price)from product
where code_maker = (select code from maker where name = 'Hewlett-Packard')
);

/* 40-Retorna tots els productes de la base de dades que tenen un preu major
 o igual al producte més car del fabricant Lenovo.*/
select *
from product
where price >= (select max(price) from product
where code_maker = (select code from maker where name = 'Lenovo')
);

/* 41 Llesta tots els productes del fabricant Asus que tenen un preu superior
 al preu mitjà de tots els seus productes.*/
SELECT name AS 'Nom del producte', price AS 'Preu (€)'
FROM product
WHERE code_maker = (SELECT code FROM maker WHERE name = 'Asus')
AND price > (SELECT AVG(price) FROM product 
WHERE code_maker = (SELECT code FROM maker WHERE name = 'Asus')
);
 
