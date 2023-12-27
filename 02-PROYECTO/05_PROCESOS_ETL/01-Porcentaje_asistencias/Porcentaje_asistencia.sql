use facultad;

SELECT estudiantes.Estudiante_ID, estudiantes.nombre, estudiantes.apellido,inscripciones_cursada.Inscripcion_ID,Materias.asignatura,materias.N°_clases,inasistencias.N°_clases_inasistidas
FROM inasistencias
INNER JOIN inscripciones_cursada ON inscripciones_cursada.Inscripcion_ID = inasistencias.Inscripcion_ID
INNER JOIN estudiantes ON inscripciones_cursada.Estudiante_ID = estudiantes.estudiante_id
INNER JOIN curso ON inscripciones_cursada.curso_ID = curso.curso_ID
INNER JOIN materias ON curso.materia_ID = materias.materia_ID;
