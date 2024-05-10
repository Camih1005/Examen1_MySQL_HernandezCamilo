


-- CONSULTAS 

-- 1

select d.nombre as departamento,p.apellido1 as apellido1,p.apellido2 as apellido2,
p.nombre as profesor from profesor as p
join departamento as d on p.id_departamento = d.id_departamento
order by d.nombre asc;

-- 2 Devuelve un listado con los profesores que no están asociados a un departamento.

select p.nombre, d.nombre as departamento from profesor as p
inner join departamento as d on p.id_departamento = d.id_departamento 
where p.id_departamento is null;-- no hay ninguno

-- 3 Devuelve un listado con los departamentos que no tienen profesores asociados.
select p.nombre as profesor, d.nombre as departamento from profesor as p
right join departamento as d on p.id_departamento = d.id_departamento 
where p.id_departamento is null;-- son 3


-- 4 Devuelve un listado con los profesores que no imparten ninguna asignatura.

select distint p.nombre from asignatura as a  join profesor as p on p.id_profesor = a.id_profesor = "null";


-- 5 Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.nombre from asignatura as a where id_profesor is null

-- 6 Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
-- El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

/*select * from asignatura as a,profesor as p,departamento as d, alumno_se_matricula_asignatura as asig
where asig.id_asignatura = a.id_asignatura and a.id_profesor = a.id_profesor and p.id_departamento = d.id_departamento and  
*/

select * from curso_escolar as c join
alumno_se_matricula_asignatura  as asig on asig.id_curso_escolar = c.id_curso_escolar
join asignatura as a on a.id_asignatura = asig.id_asignatura join profesor as 
p on p.id_profesor = a.id_profesor join departamento as d
on d.id_departamento = p.id_departamento;

-- NO SE PUDO el sexto no funciona por que al hacer la relacion se pierde las 
-- relaciones entre asi,no hay posiblididad

-- 7 Devuelve el número total de alumnas que hay.

SELECT count(nombre) from alumno where sexo = "m";

-- 8 Calcula cuántos alumnos nacieron en 1999.

select count(id_alumno) from alumno where  year(fecha_nacimiento) = 1999

-- 10 Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
-- una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. 
-- El resultado sólo debe incluir los departamentos
-- que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.


select DISTINCT  p.id_profesor,d.id_departamento  from profesor as p join departamento as d ;
;

select   d.nombre as departamento, count(sub.id_profesor) from 
(select p.id_profesor,p.id_departamento from profesor as p group by p.id_profesor)
as sub right join departamento as d on sub.id_departamento = d.id_departamento
GROUP by d.nombre;

select count(id_profesor) from profesor

-- 11 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno.
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas.
-- Estos grados también tienen que aparecer en el listado. El resultado deberá estar 
-- ordenado de mayor a menor por el número de asignaturas.

select g.nombre, count(a.id_asignatura) as cantidad from grado as g left join asignatura as a on g.id_grado = a.id_grado
GROUP by g.id_grado order by cantidad desc ;


/* 12 Devuelve un listado con el nombre de todos los grados existentes en la base de datos
 *  y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas. 
*/

select 






-- me falto terminar


