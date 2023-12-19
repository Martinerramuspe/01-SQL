USE facultad;
# CREAMOS VISTA QUE NOS PERMITA VER LA LISTA DE MATERIALES EN LAS CUALES SE HA INSCRIPTO UN ALUMNO, INSERTANDO EL ID DEL MISMO.

# TABLAS EN USO
SELECT *
FROM materias;

SELECT *
FROM curso;

SELECT *
FROM inscripciones_Cursada
WHERE Estudiante_ID =1;

# DESARROLLO SCRIPT PARTE 1___________________________________________________
SELECT *
FROM curso
INNER JOIN(
select*
from inscripciones_Cursada
where Estudiante_ID =1
) subconsulta
ON curso.curso_ID=subconsulta.curso_ID;

# DESARROLLO SCRIPT PARTE 2___________________________________________________
SELECT *
FROM curso
INNER JOIN(
select*
from inscripciones_Cursada
where Estudiante_ID =1
) subconsulta
ON curso.curso_ID=subconsulta.curso_ID
INNER JOIN materias ON materias.materia_ID=curso.materia_id;

# DESARROLLO SCRIPT PARTE 3___________________________________________________
SELECT Estudiante_ID, materias.asignatura
FROM curso
INNER JOIN(
select*
from inscripciones_Cursada
where Estudiante_ID =1
) subconsulta
ON curso.curso_ID=subconsulta.curso_ID
INNER JOIN materias ON materias.materia_ID=curso.materia_id;






