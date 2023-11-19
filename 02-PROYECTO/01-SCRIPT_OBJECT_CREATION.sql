CREATE DATABASE FACULTAD;
USE FACULTAD;
-- CREACION TABLAS SIN FOREIGN KEY_______________________________________________________
CREATE TABLE IF NOT EXISTS `FACULTAD`.`ESTUDIANTES` (
  `Estudiante_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Estudiante_ID`),
  UNIQUE INDEX (`Correo`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`PROFESORES` (
  `Profesor_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Profesor_ID`),
  UNIQUE INDEX (`Correo`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`DEPARTAMENTOS` (
  `Departamento_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Departamento_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`CUATRIMESTRE` (
  `Cuatrimestre_Id` INT NOT NULL AUTO_INCREMENT,
  `Designacion_cuatrimestral` INT NOT NULL,
  `Fecha_inicio` DATE NOT NULL,
  `Fecha_finalizacion` DATE NOT NULL,
  PRIMARY KEY (`Cuatrimestre_Id`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`SECCION` (
  `Seccion_ID` INT NOT NULL AUTO_INCREMENT,
  `1ra_nota` INT NOT NULL,
  `2da_nota` INT NOT NULL,
  `3ra_nota` INT NOT NULL,
  PRIMARY KEY (`Seccion_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`AULAS` (
  `Aula_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_aula` INT NOT NULL,
  `Capacidad` INT NOT NULL,
  PRIMARY KEY (`Aula_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`HORARIOS` (
  `Horario_ID` INT NOT NULL AUTO_INCREMENT,
  `Dia_de_la_semana` DATE NOT NULL,
  `Hora_inicio` TIME NOT NULL,
  `Hora_finalizacion` TIME NOT NULL,
  PRIMARY KEY (`Horario_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`Periodo_cursada` (
  `Periodo_cursada_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Periodo_cursada_ID`)
  );
-- CREACION TABLAS CON FOREIGN KEY_______________________________________________________

CREATE TABLE IF NOT EXISTS  `FACULTAD`.`MATERIAS` (
`Materia_ID` INT NOT NULL AUTO_INCREMENT,
`Departamento_ID` INT NOT NULL,
`Nivel` INT NOT NULL,
`Periodo_cursada_ID` INT NOT NULL,
`Asignatura` VARCHAR(45) NOT NULL,
`Carga_horaria` INT NOT NULL,
`Cursadas_necesarias` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Materia_ID`),
FOREIGN KEY (`Departamento_ID`) REFERENCES `FACULTAD`.`DEPARTAMENTOS` (`Departamento_ID`),
FOREIGN KEY (`Periodo_cursada_ID`) REFERENCES `FACULTAD`.`Periodo_cursada` (`Periodo_cursada_ID`)
);
CREATE TABLE IF NOT EXISTS `FACULTAD`.`COMISION` (
  `Comision_ID` INT NOT NULL AUTO_INCREMENT,
  `Materia_ID` INT NOT NULL,
  PRIMARY KEY (`Comision_ID`),
  FOREIGN KEY (`Materia_ID`) REFERENCES `FACULTAD`.`MATERIAS` (`Materia_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`CURSO` (
  `Curso_ID` INT NOT NULL AUTO_INCREMENT,
  `Comision_ID` INT NOT NULL,
  `Aula_ID` INT NOT NULL,
  `Profesor_ID` INT NOT NULL,
  `Horario_ID` INT NOT NULL,
  `Cuatrimestre_ID` INT NOT NULL,
  PRIMARY KEY (`Curso_ID`),
  FOREIGN KEY (`Comision_ID`) REFERENCES `FACULTAD`.`COMISION` (`Comision_ID`),
  FOREIGN KEY (`Aula_ID`) REFERENCES `FACULTAD`.`AULAS` (`Aula_ID`),
  FOREIGN KEY (`Profesor_ID`) REFERENCES `FACULTAD`.`PROFESORES` (`Profesor_ID`),
  FOREIGN KEY (`Horario_ID`) REFERENCES `FACULTAD`.`HORARIOS` (`Horario_ID`),
  FOREIGN KEY (`Cuatrimestre_ID`) REFERENCES `FACULTAD`.`CUATRIMESTRE` (`Cuatrimestre_Id`)
  );
  
CREATE TABLE IF NOT EXISTS `FACULTAD`.`INSCRIPCIONES_CURSADA` (
  `Inscripcion_ID` INT NOT NULL AUTO_INCREMENT,
  `Estudiante_ID` INT NOT NULL,
  `Curso_ID` INT NOT NULL,
  `Fecha_inscripcion` DATE NOT NULL,
  PRIMARY KEY (`Inscripcion_ID`),
  FOREIGN KEY (`Estudiante_ID`) REFERENCES `FACULTAD`.`ESTUDIANTES` (`Estudiante_ID`),
  FOREIGN KEY (`Curso_ID` ) REFERENCES `FACULTAD`.`CURSO` (`Curso_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`CALIFICACIONES` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Inscripcion_ID` INT NOT NULL,
  `Seccion_ID` INT NOT NULL,
  `Calificacion` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Inscripcion_ID`) REFERENCES `FACULTAD`.`INSCRIPCIONES_CURSADA`(`Inscripcion_ID`),
  FOREIGN KEY (`Seccion_ID`) REFERENCES `FACULTAD`.`SECCION` (`Seccion_ID`)
  );
CREATE TABLE IF NOT EXISTS `FACULTAD`.`ASISTENCIAS` (
  `Asistencia_ID` INT NOT NULL AUTO_INCREMENT,
  `INSCRICPION_CURSADA_ID` INT NOT NULL,
  `Cantidad de dias` INT NOT NULL,
  PRIMARY KEY (`Asistencia_ID`),
  FOREIGN KEY (`INSCRICPION_CURSADA_ID`) REFERENCES `FACULTAD`.`INSCRIPCIONES_CURSADA` (`Inscripcion_ID`)
  );
  
  
-- CREACION DE AUDITORIAS________________________________________________________________
-- CREACION DE VISTAS____________________________________________________________________
-- MySQL Workbench Forward Engineering


  







