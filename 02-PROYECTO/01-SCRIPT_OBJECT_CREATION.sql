CREATE DATABASE FACULTAD;
USE FACULTAD;
-- CREACION TABLAS SIN FOREIGN KEY_______________________________________________________
CREATE TABLE IF NOT EXISTS `FACULTAD`.`Estudiantes` (
  `Estudiante_ID`INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Estudiante_ID`),
  UNIQUE INDEX (`Correo`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Profesores` (
  `Profesor_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Profesor_ID`),
  UNIQUE INDEX (`Correo`) 
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Carreras` (
  `Carrera_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_carrera` VARCHAR(45) NOT NULL,
  `Descripticion` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Carrera_ID`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Departamento` (
  `Departamento_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Departamento_ID`)
  );

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Aulas`(
  `Aula_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_aula` VARCHAR(45) NOT NULL,
  `Capacidad` INT NOT NULL,
  PRIMARY KEY (`Aula_ID`)
  );

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Evento` (
  `Evento_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_evento` VARCHAR(45) NOT NULL,
  `Fecha_evento` DATETIME NOT NULL,
  `Descripcion_evento` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`Evento_ID`) 
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Biblioteca` (
  `Libro_ID` INT NOT NULL AUTO_INCREMENT,
  `Titulo_libro` VARCHAR(90) NOT NULL,
  `Autor` VARCHAR(90) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Disponidad` INT NOT NULL,
  PRIMARY KEY (`Libro_ID`)
  );

-- CREACION TABLAS CON FOREIGN KEY________________________________________________________________

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Cursos` (
  `Curso_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_carrera` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(80) NOT NULL,
  `Carrera_ID` INT NOT NULL,
  PRIMARY KEY (`Curso_ID`),
  FOREIGN KEY (`Carrera_ID`) REFERENCES `FACULTAD`.`Carreras` (`Carrera_ID`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Horarios_de_cursos` (
  `Horario_ID` INT NOT NULL AUTO_INCREMENT,
  `Dia_de_la_semana` DATE NOT NULL,
  `Hora_inicio` TIME NOT NULL,
  `Hora_finalizacion` TIME NOT NULL,
  `Curso_ID` INT NOT NULL,
  PRIMARY KEY (`Horario_ID`),
  FOREIGN KEY (`Curso_ID`) REFERENCES `FACULTAD`. `Cursos` (`Curso_ID`)
);


CREATE TABLE IF NOT EXISTS `FACULTAD`.`Calificaciones` (
  `Calificacion_ID` INT NOT NULL AUTO_INCREMENT,
  `Calificacion` INT NOT NULL,
  `Estudiante_ID` INT NOT NULL,
  `Curso_ID` INT NOT NULL,
  PRIMARY KEY (`Calificacion_ID`),
  FOREIGN KEY (`Estudiante_ID`) REFERENCES `FACULTAD`.`Estudiantes` (`Estudiante_ID`),
  FOREIGN KEY (`Curso_ID`) REFERENCES `FACULTAD`.`Cursos` (`Curso_ID`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Materias` (
  `Materia_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_materia` VARCHAR(45) NOT NULL,
  `Descripcion_materia` VARCHAR(80) NOT NULL,
  `Departamento_ID` INT NOT NULL,
  PRIMARY KEY (`Materia_ID`),
  FOREIGN KEY (`Departamento_ID`) REFERENCES `FACULTAD`.`Departamento` (`Departamento_ID`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Asistencia_evento` (
  `Asistencia_ID` INT NOT NULL AUTO_INCREMENT,
  `Fecha_de_asistencia` DATE NOT NULL,
  `Estudiante_ID` INT NOT NULL,
  `Evento_ID` INT NOT NULL,
  PRIMARY KEY (`Asistencia_ID`),
  FOREIGN KEY (`Estudiante_ID`) REFERENCES `FACULTAD`.`Estudiantes` (`Estudiante_ID`),
  FOREIGN KEY (`Evento_ID`) REFERENCES `FACULTAD`.`Evento` (`Evento_ID`)
);

CREATE TABLE IF NOT EXISTS `FACULTAD`.`Prestamos_libros` (
  `Prestamos_ID` INT NOT NULL AUTO_INCREMENT,
  `Fecha_prestamo` DATE NOT NULL,
  `Fecha_devolucion` DATE NOT NULL,
  `Estudiante_ID` INT NOT NULL,
  `Libro_ID` INT NOT NULL,
  PRIMARY KEY (`Prestamos_ID`),
  FOREIGN KEY (`Estudiante_ID`) REFERENCES `FACULTAD`.`Estudiantes` (`Estudiante_ID`),
  FOREIGN KEY (`Libro_ID`) REFERENCES `FACULTAD`.`Biblioteca` (`Libro_ID`)
);

-- CREACION DE AUDITORIAS________________________________________________________________________________
-- CREACION DE VISTAS_____________________________________________________________________________



