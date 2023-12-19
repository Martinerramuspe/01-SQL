DELIMITER //

CREATE FUNCTION ObtenerAsignaturasPorEstudiante(estudianteId INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE listaAsignaturas VARCHAR(255);
    
    SELECT GROUP_CONCAT(materias.asignatura) INTO listaAsignaturas
    FROM curso
    INNER JOIN (
        SELECT *
        FROM inscripciones_Cursada
        WHERE Estudiante_ID = estudianteId
    ) subconsulta ON curso.curso_ID = subconsulta.curso_ID
    INNER JOIN materias ON materias.materia_ID = curso.materia_id;

    RETURN listaAsignaturas;
END //

DELIMITER ;

