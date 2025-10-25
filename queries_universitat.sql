-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes.
-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1,apellido2,nombre  from persona where tipo = "alumno" order by apellido1 asc,apellido2 asc,nombre asc;
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select apellido1,apellido2,nombre  from persona where tipo = "alumno" and telefono is null;
-- Retorna el llistat dels alumnes que van néixer en 1999.
select  apellido1,apellido2,nombre  from persona where tipo = "alumno" and YEAR(fecha_nacimiento) = 1999; 
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select apellido1,apellido2,nombre,nif  from persona where tipo = "profesor" and telefono is null and SUBSTRING(nif,LENGTH(nif) ,1) = "k";
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats.
-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
-- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select persona.apellido1,persona.apellido2,persona.nombre,departamento.nombre as "departamento" from profesor inner join departamento on profesor.id_departamento = departamento.id inner join persona on profesor.id_profesor = persona.id and persona.tipo = "profesor" order by persona.apellido1 asc,persona.apellido2 asc,persona.nombre asc;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select asignatura.nombre as "asignatura",curso_escolar.anyo_inicio as "año inicio" , curso_escolar.anyo_fin as "año fin" from asignatura inner join alumno_se_matricula_asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura inner join persona on persona.id = alumno_se_matricula_asignatura.id_alumno inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id where persona.tipo = "alumno" and persona.nif ="26902806M";
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select departamento.nombre from departamento inner join profesor on departamento.id = profesor.id_departamento inner join asignatura on profesor.id_profesor = asignatura.id_profesor inner join grado on grado.id = asignatura.id_grado where grado.nombre ="Grado en Ingeniería Informática (Plan 2015)" group by departamento.nombre;
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select persona.apellido1,persona.apellido2,persona.nombre from persona inner join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id where curso_escolar.anyo_inicio >= 2018 and curso_escolar.anyo_fin <= 2019 and persona.tipo = "alumno" group by persona.id;
