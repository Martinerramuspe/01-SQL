-- CREACION BASE DE DATOS______________________________________________________________________________________________________________________________________
CREATE DATABASE Produccion;
USE Produccion;
-- CREACION TABLAS SIN FOREIGN KEY_____________________________________________________________________________________________________________________________________________ 
CREATE TABLE `Proyectos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(30) NOT NULL,
  `Tiempo_ejecucion` INT NOT NULL,
  `Cliente` VARCHAR(30) NOT NULL,
  `Monto_de_obra` FLOAT NOT NULL,
  PRIMARY KEY (`Id`));

CREATE TABLE IF NOT EXISTS `Maquinas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Tipo_de_maquina` VARCHAR(30) NOT NULL,
  `Capacidad_tanque_litros` INT NOT NULL,
  `Marca` VARCHAR(30) NOT NULL,
  `Rendimiento_LxDia` INT NOT NULL,
  `Tipo_combustible` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`)
  ); 

CREATE TABLE IF NOT EXISTS `Jornadas_laborales` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Periodo_laboral_dias` INT NOT NULL,
  `Periodo_franco_dias` INT NOT NULL,
  `Hora_ingreso` TIME NOT NULL,
  PRIMARY KEY (`Id`)
  ); 
  
CREATE TABLE `Items` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Proyectos_Id` INT NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Periodo_dias` FLOAT NOT NULL,
  `Fecha_inicio` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
	FOREIGN KEY (`Proyectos_Id`) REFERENCES `Proyectos` (`Id`)
    );
    
CREATE TABLE IF NOT EXISTS `Proveedores` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Razon_social` VARCHAR(30) NOT NULL,
  `Forma_de_pago` VARCHAR(30) NOT NULL,
  `Telefono` INT NOT NULL,
  `Mail` VARCHAR(30) NOT NULL,
  `Ubicacion` VARCHAR(30) NOT NULL,
  `Fecha_de_inscripcion` DATETIME NOT NULL,
  PRIMARY KEY (`Id`)
  );
  
CREATE TABLE  `Subcontratistas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Razon_social` VARCHAR(30) NOT NULL,
  `Forma_de_pago` VARCHAR(30) NOT NULL,
  `Telefono` INT NOT NULL,
  `Mail` VARCHAR(30) NOT NULL,
  `Ubicacion` VARCHAR(30) NOT NULL,
  `Fecha_inscripcion` DATETIME NOT NULL,
  `Tipo_de_servicio` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Id`)
  );
  
CREATE TABLE  `Empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(30) NOT NULL,
  `Dni` INT NOT NULL,
  `Mail` VARCHAR(30) NOT NULL,
  `Fecha_inscripcion` DATE,
  PRIMARY KEY (`Id`)
  );

CREATE TABLE  `RegistroConsultasProveedor` (
  Id INT NOT NULL AUTO_INCREMENT,
  Consulta VARCHAR(255) NOT NULL,
  Fecha DATETIME NOT NULL,
  PRIMARY KEY (Id)
);  

CREATE TABLE  `Categorias` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Id`)
  );
  
-- CREACION TABLAS CON FOREIGN KEY_____________________________________________________________________________________________________________________________________________ 
CREATE TABLE  `Personal_vial` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Empleados` INT NOT NULL,
  `Fecha_carnet_conducir_actualizado` DATE NOT NULL,
  `Fecha_carnet_medico_actualizado` DATE NOT NULL,
  `Condicion_medica_habilitada` INT NULL,
  `Condicion_conductor_habilitado` INT NULL,
  PRIMARY KEY (`Id`),                                                                 
  FOREIGN KEY (`Id_Empleados`) REFERENCES `Empleados` (`Id`)
  );

CREATE TABLE IF NOT EXISTS `Equipos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Personal_vial` INT NOT NULL,
  `Maquinas_Id` INT NOT NULL,
  `Jornadas_laborales_Id` INT NOT NULL,
  `Items_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
    FOREIGN KEY (`Items_Id`) REFERENCES `Items` (`Id`),
    FOREIGN KEY (`Maquinas_Id`) REFERENCES `Maquinas` (`Id`),
    FOREIGN KEY (`Jornadas_laborales_Id`) REFERENCES `Jornadas_laborales` (`Id`),
    FOREIGN KEY (`Id_Personal_vial`) REFERENCES `personal_vial`(`Id`)
    ); 
 
CREATE TABLE  `Personal_civil` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Empleados` INT NOT NULL,
  `Id_Categorias` INT NOT NULL,
  `Gremialista` INT NOT NULL,
  PRIMARY KEY (`Id`),                                                                 
  FOREIGN KEY (`Id_Empleados`) REFERENCES `Empleados` (`Id`),
  FOREIGN KEY (`Id_Categorias`) REFERENCES `Categorias` (`Id`)  
  ); 

CREATE TABLE IF NOT EXISTS`Mano_de_obra` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Items_Id` INT NOT NULL,
  `Jornadas_labores_Id` INT NOT NULL,
  `Id_Personal_civil` INT NOT NULL,  
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Items_Id`) REFERENCES `Items` (`Id`),
  FOREIGN KEY (`Jornadas_labores_Id`) REFERENCES `Jornadas_laborales` (`Id`),
  FOREIGN KEY (`Id_Personal_civil`) REFERENCES `Personal_civil` (`Id`)
  );
    
CREATE TABLE IF NOT EXISTS `Materiales` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Items_Id` INT NOT NULL,
  `Proveedores_Id` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Unidad` VARCHAR(30) NOT NULL,
  `Cantidad` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Id`),
    FOREIGN KEY (`Items_Id`) REFERENCES `Items` (`Id`),
    FOREIGN KEY (`Proveedores_Id`) REFERENCES `Proveedores` (`Id`)
    );
    
CREATE TABLE IF NOT EXISTS `Servicios_subcontratistas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Items_Id` INT NOT NULL,
  `Subcontratistas_Id` INT NOT NULL,
  `Unidad` VARCHAR(30) NOT NULL,
  `Cantidad` FLOAT NOT NULL,
  `Detalle_de_actividad` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
   FOREIGN KEY (`Subcontratistas_Id`) REFERENCES `Subcontratistas` (`Id`),
   FOREIGN KEY (`Items_Id`) REFERENCES `Items` (`Id`)
    ); 
      
-- CREACION DE VISTAS____________________________________________________________________________________________________________________________________________________________

#VISTA_1: NECESITAMOS UNA VISTA DEL TOTAL DE HORMIGON QUE SE CONTRATO EN CADA ITEM DEL PROYECTO Id= 1, 
 CREATE VIEW consulta AS
 SELECT Items_Id, Cantidad
 FROM Servicios_subcontratistas
 WHERE Subcontratistas_Id = 2;
  
CREATE VIEW VISTA_1 AS
SELECT SUM(Cantidad)
FROM consulta;

#VISTA_2: NECESITAMOS SABER LA CANTIDAD DE MAQUINARIA PROPIA QUE TRABAJA EN LA ACTIVIDAD 5,DEL PROYECTO DE LA PISTA.
CREATE VIEW VISTA_2 AS
SELECT COUNT(*) AS total_maquinas
FROM Equipos
GROUP BY Items_Id;

#VISTA_3:SE NECESITA SABER LA CANTIDAD DE COMBUSTIBLE QUE SE CONSUMIO EN LA ACTIVIDAD 5 (Para llegar al objetivo, necesitamos realizar etapas previas).
#ETAPA N°1
CREATE VIEW etapa_1 AS
SELECT Equipos.Id, Maquinas.Tipo_de_maquina ,Maquinas.Rendimiento_LxDia, Equipos.Items_Id 
FROM Equipos
JOIN Maquinas ON Equipos.Maquinas_Id = Maquinas.Id;


#ETAPA N°2
CREATE VIEW etapa_2 AS
SELECT etapa_1.Id,etapa_1.Tipo_de_maquina,etapa_1.Rendimiento_LxDia,Items.Nombre,Items.Periodo_dias
FROM etapa_1
JOIN Items ON etapa_1.Items_id=Items.Id;


#ETAPA N°3
CREATE VIEW etapa_3 AS
SELECT id,Tipo_de_maquina , Rendimiento_LxDia,Periodo_dias, Rendimiento_LxDia * Periodo_dias AS consumo
FROM etapa_2;


#ETAPA N°4
CREATE VIEW VISTA_3 AS
SELECT  SUM(consumo) AS CANTIDAD_TOTAL_CONSUMIDA
FROM etapa_3;


#VISTA_4: CUAL ES LA OBRA QUE MAS SUBCONTRATISTAS CONTRATO? 
CREATE VIEW proceso11 AS
SELECT Servicios_subcontratistas.Id,Servicios_subcontratistas.Items_Id, items.Proyectos_Id, Servicios_subcontratistas.Detalle_de_actividad
FROM Servicios_subcontratistas
JOIN Items ON Items.Id = Servicios_subcontratistas.Items_Id;

CREATE VIEW VISTA_4 AS
SELECT Proyectos_Id, COUNT(Proyectos_Id) AS CANT_DE_SUBCONTRATISTAS_POR_PROYECTO
FROM proceso11
GROUP BY (Proyectos_Id);

#VISTA_5: UOCRA NECESITA SABER EL PERSONAL TOTAL QUE TRABAJA EN TODAS LAS OBRAS.
CREATE  VIEW VISTA_5 AS
SELECT I.Proyectos_Id, COUNT(M.Id_Personal_civil) AS Cantidad_Personal
FROM Mano_de_obra M
JOIN Items I ON M.Items_Id = I.Id
GROUP BY I.Proyectos_Id;

 -- CREACION DE STORE-PROCEDURE____________________________________________________________________________________________________________________________________________________
  
#STORE-PROCEDURE_1: MEDIANTE EL INGRESO DEL NOMBRE DEL PROOVEDOR NECESITAMOS PODER OBSERVAR EL RESTO DE SUS DATOS.
DELIMITER //
CREATE PROCEDURE Informacion_proveedor(IN razonSocial VARCHAR(30))
BEGIN
  SELECT Telefono, Mail, Ubicacion, Fecha_de_inscripcion
  FROM Proveedores
  WHERE Razon_social = razonSocial;
END //
DELIMITER ;

#STORE-PROCEDURE_2: MEDIANTE EL INGRESO DEL NOMBRE DEL PROOVEDOR NECESITAMOS VER LISTA DE LAS ACTIVIDADES DONDE INTERVINO Y A QUE PROYECTO
DELIMITER //
CREATE PROCEDURE intervencion_items_proyectos(IN razonSocial VARCHAR(30))
BEGIN
  SELECT DISTINCT M.Items_Id, I.Proyectos_Id
  FROM Proveedores P
  INNER JOIN Materiales M ON M.Proveedores_Id = P.Id
  INNER JOIN Items I ON I.Id = M.Items_Id
  WHERE P.Razon_social = razonSocial;
END //
DELIMITER ;

#STORE-PROCEDURE_3: CREAMOS STORE PROCEDURE QUE AL INGRESAR EL NOMBRE DEL PROVEEDOR, NOS DEVUELVA LAS 2 CONSULTAS CREADAS ANTERIORMENTE, Y ADEMAS, SE REGRISTRE ESA CONSULTA EN UNA TABLA MENDIANTE UN TRIGGER.
# Tuvimos el incoveniente de que no se puede realizar registros de consulta, mediante trigger, por lo que se procedio a realizarlo con el mismo store procedure.
DELIMITER //
CREATE PROCEDURE detalle_proveedor(IN razonSocial VARCHAR(30))
BEGIN
  -- Datos del proveedor
  SELECT Telefono, Mail, Ubicacion, Fecha_de_inscripcion
  FROM Proveedores
  WHERE Razon_social = razonSocial;

  -- A qué items y proyectos se vincula este proveedor
  SELECT M.Items_Id, I.Proyectos_Id
  FROM Proveedores P
  INNER JOIN Materiales M ON M.Proveedores_Id = P.Id
  INNER JOIN Items I ON I.Id = M.Items_Id
  WHERE P.Razon_social = razonSocial;

  -- Registrar la consulta en la tabla de auditoría
INSERT INTO RegistroConsultasProveedor (Consulta, Fecha)
VALUES (CONCAT('(''', razonSocial, ''')'), NOW());

END //
DELIMITER ;


#STORE-PROCEDURE_4: STORE PROCEDURE VINCULADO A UNA TRANSACCION, SI EL PROVEEDOR NO EXISTEN, SE APLICA UN ROOL-BACK Y DEVUELVE UN MENSAJE-
DELIMITER //
CREATE PROCEDURE detalle_proveedor2(IN razonSocial VARCHAR(30))
BEGIN
  -- Inicio de la transacción
  START TRANSACTION;

  -- Verificar si la razonSocial existe en la tabla Proveedores
  IF EXISTS (SELECT 1 FROM Proveedores WHERE Razon_social = razonSocial) THEN
    -- Datos del proveedor
    SELECT Telefono, Mail, Ubicacion, Fecha_de_inscripcion
    FROM Proveedores
    WHERE Razon_social = razonSocial;

    -- A qué items y proyectos se vincula este proveedor
    SELECT M.Items_Id, I.Proyectos_Id
    FROM Proveedores P
    INNER JOIN Materiales M ON M.Proveedores_Id = P.Id
    INNER JOIN Items I ON I.Id = M.Items_Id
    WHERE P.Razon_social = razonSocial;

    -- Registrar la consulta en la tabla de auditoría
    INSERT INTO RegistroConsultasProveedor (Consulta, Fecha)
    VALUES (CONCAT('(', razonSocial, ')'), NOW());

    -- Commit de la transacción
    COMMIT;
  ELSE
    -- Rollback de la transacción
    ROLLBACK;
    -- Mensaje de error
    SELECT 'Este proveedor no se encuentra registrado' AS Error;
  END IF;
END //
DELIMITER ;

-- CREACION DE FUNCIONES____________________________________________________________________________________________________________________________________________________

#FUNCION_1: NECESITAMOS DETERMINAR LA CANTIDAD DE EMPLEADOS QUE HAY INSCRIPTOS DENTRO DE LA EMPRESA EN DETERMINADO PERIODO DE TIEMPO.
DELIMITER //
CREATE FUNCTION Cantidad_de_empleados(Fecha_inicio DATE, Fecha_Fin DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE cantidad INT;
  
  SELECT COUNT(*) INTO cantidad
  FROM Empleados
  WHERE Fecha_inscripcion BETWEEN Fecha_inicio AND Fecha_Fin;
  
  RETURN cantidad;
END //
DELIMITER ;


#FUNCION_2: NECESITAMOS DETERMINAR LA CANTIDAD DE MAQUINAS QUE SE USARON POR PROYECTO
SELECT COUNT(DISTINCT Maquinas_Id) AS Cantid_Maquinas  -- Partimos de crear la  consulta, para luego ser transformada en funcion
FROM Equipos
INNER JOIN Items ON Equipos.Items_Id = Items.Id
WHERE Items.Proyectos_Id = 2; -- Reemplaza  con el ID del proyecto que deseas consultar

DELIMITER //
CREATE FUNCTION Cantid_Maquinas(IdProyecto INT) RETURNS INT -- Cremos la FUNCION, en base la consulta anteriror.
DETERMINISTIC 
BEGIN
    DECLARE cantidad INT;
    
    SELECT COUNT(DISTINCT Maquinas_Id) INTO cantidad
    FROM Equipos
    INNER JOIN Items ON Equipos.Items_Id = Items.Id
    WHERE Items.Proyectos_Id = IdProyecto;
    
    RETURN cantidad;
END //
DELIMITER ;

-- CREACION DE TRIGGERS____________________________________________________________________________________________________________________________________________________

#TRIGGER_1: ME PERMITE CALCULAR DE FORMA AUTOMATICA, AL INSERTAR UN DATO, SI EL CARNET MEDICO ESTA VENCIDO.
DELIMITER $$
CREATE TRIGGER calculo_vencimiento_medico 
BEFORE INSERT ON personal_vial
FOR EACH ROW
BEGIN
  IF DATEDIFF(CURDATE(), NEW.Fecha_carnet_medico_actualizado) > 730 THEN
    SET NEW.Condicion_medica_habilitada = 0;
  ELSE
    SET NEW.Condicion_medica_habilitada = 1;
  END IF;
END $$

#TRIGGER_2: ME PERMITE CALCULAR DE FORMA AUTOMATICA, AL MODIFICAR UN DATO, SI EL CARNET MEDICO ESTA VENCIDO.
DELIMITER //
CREATE TRIGGER actualizacion_medico
BEFORE UPDATE ON personal_vial
FOR EACH ROW
BEGIN
  IF DATEDIFF(CURDATE(), NEW.Fecha_carnet_medico_actualizado) > 730 THEN
    SET NEW.Condicion_medica_habilitada = 0;
  ELSE
    SET NEW.Condicion_medica_habilitada = 1;
  END IF;
END//

#TRIGGER_3: ME PERMITE CALCULAR DE FORMA AUTOMATICA, AL INSERTAR UN DATO, SI EL CARNET CONDUCIR ESTA VENCIDO.
DELIMITER $$
CREATE TRIGGER calculo_vencimiento_conductor
BEFORE INSERT ON personal_vial
FOR EACH ROW
BEGIN
  IF DATEDIFF(CURDATE(), NEW.Fecha_carnet_conducir_actualizado) > 360 THEN
    SET NEW.Condicion_conductor_habilitado = 0;
  ELSE
    SET NEW.Condicion_conductor_habilitado = 1;
  END IF;
END $$

#TRIGGER_4: QUE ME PERMITE CALCULAR DE FORMA AUTMATICA, AL MODIFICAR UN DATO, SI EL CARNET CONDUCIR ESTA VENCIDO.
DELIMITER //
CREATE TRIGGER actualizacion_conductor
BEFORE UPDATE ON personal_vial
FOR EACH ROW
BEGIN
  IF DATEDIFF(CURDATE(), NEW.Fecha_carnet_conducir_actualizado) > 360 THEN
    SET NEW.Condicion_conductor_habilitado = 0;
  ELSE
    SET NEW.Condicion_conductor_habilitado = 1;
  END IF;
END //

-- AUDITORIAS___________________________________________________________________________________________________________________________________________________________

CREATE TABLE `registration_machines` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_maquina` INT NOT NULL,
  `Tipo_operacion` VARCHAR(40) NOT NULL,
  `Fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id_maquina`) REFERENCES `maquinas` (`Id`)
  );
  
#INSERCION-------------------
DELIMITER $$
CREATE TRIGGER after_insertar_maquinas
AFTER INSERT ON maquinas
FOR EACH ROW
BEGIN
  INSERT INTO registration_machines (Id_maquina, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'INSERTE', CURDATE());
END$$

#ACTUALIZACION-----------------
DELIMITER //
CREATE TRIGGER after_actualizar_maquinas
AFTER UPDATE ON maquinas
FOR EACH ROW
BEGIN
  INSERT INTO registration_machines (Id_maquina, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'UPDATE', CURDATE());
END//

#ELIMINACION---------------------
DELIMITER $$
CREATE TRIGGER after_eliminar_maquinas
AFTER DELETE ON maquinas
FOR EACH ROW
BEGIN
  INSERT INTO registration_machines (Id_maquina, Tipo_operacion, Fecha_registro)
  VALUES (OLD.Id, 'DELETE', CURDATE());
END$$

#REGISTROS PARA TABLA "EMPLEADOS"------------
#CREACION DE TABLA DE REGISTRO--
CREATE TABLE `staff_record` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `empleados_Id` INT NOT NULL,
  `Tipo_operacion` VARCHAR(40) NOT NULL,
  `Fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`empleados_Id`) REFERENCES `empleados` (`Id`)
  );

#INSERCION-------------------
DELIMITER $$
CREATE TRIGGER after_insertar_empleados
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
  INSERT INTO staff_record (empleados_Id, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'INSERTE', CURDATE());
END$$

#ACTUALIZACION-----------------
DELIMITER //
CREATE TRIGGER after_actualizar_empleados
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
  INSERT INTO staff_record (empleados_Id, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'UPDATE', CURDATE());
END//

#ELIMINACION---------------------
DELIMITER $$
CREATE TRIGGER after_eliminar_empleados
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
  INSERT INTO staff_record (empleados_Id, Tipo_operacion, Fecha_registro)
  VALUES (OLD.Id, 'DELETE', CURDATE());
END$$

#REGISTROS PARA TABLA "PROVEEDORES"----------
#CREACION DE TABLA DE REGISTRO--
CREATE TABLE `supplier_registration` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_proveedores` INT NOT NULL,
  `Tipo_operacion` VARCHAR(40) NOT NULL,
  `Fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id_proveedores`) REFERENCES `proveedores` (`Id`)
  );

#INSERCION-------------------
DELIMITER $$
CREATE TRIGGER after_insertar_proveedor
AFTER INSERT ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO supplier_registration (Id_proveedores, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'INSERTE', CURDATE());
END$$

#ACTUALIZACION-----------------
DELIMITER //
CREATE TRIGGER after_actualizar_proveedores
AFTER UPDATE ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO supplier_registration (Id_proveedores, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'UPDATE', CURDATE());
END//

#ELIMINACION---------------------
DELIMITER $$
CREATE TRIGGER after_eliminar_proveedores
AFTER DELETE ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO supplier_registration (Id_proveedores, Tipo_operacion, Fecha_registro)
  VALUES (OLD.Id, 'DELETE', CURDATE());
END$$

#CREACION DE TABLA DE REGISTRO--
CREATE TABLE `subcontractor_registration` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `subcontratistas_Id` INT NOT NULL,
  `Tipo_operacion` VARCHAR(40) NOT NULL,
  `Fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`subcontratistas_Id`) REFERENCES `subcontratistas` (`Id`)
  );

#INSERCION-------------------
DELIMITER $$
CREATE TRIGGER after_insertar_subcontratistas
AFTER INSERT ON subcontratistas
FOR EACH ROW
BEGIN
  INSERT INTO subcontractor_registration (subcontratistas_Id, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'INSERTE', CURDATE());
END$$

#ACTUALIZACION-----------------
DELIMITER //
CREATE TRIGGER after_actualizar_subcontratistas
AFTER UPDATE ON subcontratistas
FOR EACH ROW
BEGIN
  INSERT INTO subcontractor_registration (subcontratistas_Id, Tipo_operacion, Fecha_registro)
  VALUES (NEW.Id, 'UPDATE', CURDATE());
END//

#ELIMINACION---------------------
DELIMITER $$
CREATE TRIGGER after_eliminar_subcontratistas
AFTER DELETE ON subcontratistas
FOR EACH ROW
BEGIN
  INSERT INTO subcontractor_registration (subcontratistas_Id, Tipo_operacion, Fecha_registro)
  VALUES (OLD.Id, 'DELETE', CURDATE());
END$$






DROP DATABASE produccion;
 
