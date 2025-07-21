/* 1-Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
select apellido1, apellido2, nombre
from persona
where tipo = 'alumno'
order by apellido1 asc, apellido2 asc, nombre asc;

/*2-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta 
el seu número de telèfon en la base de dades.*/
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno' and telefono is null;

/*3-Retorna el llistat dels alumnes que van néixer en 1999.*/
select nombre, apellido1, apellido2, fecha_nacimiento
from persona
where tipo = 'alumno' and year (fecha_nacimiento) = 1999;

/* 4-Retorna el llistat de professors/es que no han donat d'alta 
el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
select nombre, apellido1, apellido2, nif
from persona
where tipo = 'profesor'
and telefono is null
and nif like '%k';

/* 5-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre,
 en el tercer curs del grau que té l'identificador 7.*/
select nombre, creditos, tipo
from asignatura
where cuatrimestre = 1
and curso = 3
and id_grado = 7;
 
 /* 6-Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
 El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament.
 El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
select p.apellido1, p.apellido2, p.nombre, d.nombre as departamento
from profesor pr
join persona p on pr.id_profesor = p.id
join departamento d on pr.id_departamento = d.id
order by p.apellido1, p.apellido2, p.nombre;

/* 7- Retorna un llistat amb el nom de les assignatures,
 any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
select a.nombre as assignatura, ce.anyo_inicio, ce.anyo_fin
from alumno_se_matricula_asignatura am
join persona p on am.id_alumno = p.id
join asignatura a on am.id_asignatura = a.id
join curso_escolar ce on am.id_curso_escolar = ce.id
where p.nif = '26902806M';

/*8-Retorna un llistat amb el nom de tots els departaments que tenen professors/es 
que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
select distinct d.nombre as departament
from departamento d
join profesor pr on d.id = pr.id_departamento
join asignatura a on pr.id_profesor = a.id_profesor
join grado g on a.id_grado = g.id
where g.nombre = 'grado en ingeniería informática (plan 2015)';

/* 9-Retorna un llistat amb tots els alumnes que s'han matriculat 
en alguna assignatura durant el curs escolar 2018/2019*/
select distinct p.nombre, p.apellido1, p.apellido2
from alumno_se_matricula_asignatura am
join persona p on am.id_alumno = p.id
join curso_escolar ce on am.id_curso_escolar = ce.id
where p.tipo = 'alumno'
and ce.anyo_inicio = 2018
and ce.anyo_fin = 2019;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.*/

/* 1-Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
select d.nombre as departament, p.apellido1, p.apellido2, p.nombre
from profesor pr
left join departamento d on pr.id_departamento = d.id
left join persona p on pr.id_profesor = p.id
order by d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 2-retorna un llistat amb els professors/es que no estan associats a un departament.
select p.nombre, p.apellido1, p.apellido2
from profesor pr
left join departamento d on pr.id_departamento = d.id
join persona p on pr.id_profesor = p.id
where pr.id_departamento is null;

/*3-Retorna un llistat amb els departaments que no tenen professors/es associats.*/
select d.nombre as departament
from departamento d
left join profesor pr on d.id = pr.id_departamento
where pr.id_departamento is null;

-- 4-Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select p.nombre, p.apellido1, p.apellido2
from profesor pr
left join asignatura a on pr.id_profesor = a.id_profesor
join persona p on pr.id_profesor = p.id
where a.id is null;

-- 5-Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select a.nombre
from asignatura a
left join profesor pr on a.id_profesor = pr.id_profesor
where a.id_profesor is null;

-- 6-Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select distinct d.nombre as departament
from departamento d
left join profesor pr on d.id = pr.id_departamento
left join asignatura a on pr.id_profesor = a.id_profesor
left join alumno_se_matricula_asignatura am on a.id = am.id_asignatura
where am.id_asignatura is null;

/* CONSULTES RESUM*/
-- 1- Retorna el nombre total d'alumnes que hi ha.
select count(*) as total_alumnes
from persona
where tipo = 'alumno';

-- 2-Calcula quants alumnes van néixer en 1999.
select count(*) as total_alumnes_1999
from persona
where tipo = 'alumno'
and year(fecha_nacimiento) = 1999;

/* 3- Calcula quants professors/es hi ha en cada departament.
 El resultat només ha de mostrar dues columnes,
 una amb el nom del departament i una altra amb el nombre 
 de professors/es que hi ha en aquest departament.
 El resultat només ha d'incloure els departaments 
 que tenen professors/es associats 
 i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
select d.nombre as departament, count(*) as total_professors
from profesor pr
join departamento d on pr.id_departamento = d.id
group by d.nombre
order by total_professors desc;

/* 4- Retorna un llistat amb tots els departaments i el nombre de professors/es
 que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments 
 que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.*/
select d.nombre as departament, count(pr.id_profesor) as total_professors
from departamento d
left join profesor pr on d.id = pr.id_departamento
group by d.nombre;

/* 5- Retorna un llistat amb el nom de tots els graus existents en la base de dades
 i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir
 graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat.
 El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
select g.nombre as grau, count(a.id) as total_assignatures
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
order by total_assignatures desc;

/* 6-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre
 d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades*/
select g.nombre as grau, count(a.id) as total_assignatures
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
having count(a.id) > 40
order by total_assignatures desc;

/* 7-Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits
 que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau,
 tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
select g.nombre as grau, a.tipo as tipus_assignatura, sum(a.creditos) as total_credits
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre, a.tipo
order by g.nombre, a.tipo;

/* 8-Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun
 dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici 
 del curs escolar i una altra amb el nombre d'alumnes matriculats.*/
select ce.anyo_inicio, count(distinct am.id_alumno) as total_alumnes
from alumno_se_matricula_asignatura am
join curso_escolar ce on am.id_curso_escolar = ce.id
group by ce.anyo_inicio
order by ce.anyo_inicio;

/* 9-Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a.
 El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura.
 El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures.
 El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
select p.id, p.nombre, p.apellido1, p.apellido2, count(a.id) as nombre_assignatures
from profesor pr
left join persona p on pr.id_profesor = p.id
left join asignatura a on pr.id_profesor = a.id_profesor
group by p.id, p.nombre, p.apellido1, p.apellido2
order by nombre_assignatures desc;

-- 10- Retorna totes les dades de l'alumne/a més jove.
select *
from persona
where tipo = 'alumno'
and fecha_nacimiento = (select max(fecha_nacimiento)
from persona
where tipo = 'alumno'
);

-- 11- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura
select p.nombre, p.apellido1, p.apellido2, d.nombre as departament
from profesor pr
join persona p on pr.id_profesor = p.id
join departamento d on pr.id_departamento = d.id
left join asignatura a on pr.id_profesor = a.id_profesor
where a.id is null;