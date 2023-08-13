USE Produccion;
INSERT INTO proveedores (Id, Razon_social, Forma_de_pago,telefono,mail,ubicacion,Fecha_de_inscripcion) VALUES
(1,"Nimat","Transferencia",34541478,"info_nimat@gmail.com","Concordia","1999-4-14 07:00:00"),
(2,"MP.servicios","Efectivo",34578741,"mp_servicios@gmail.com","San_jose","1992-12-15 07:00:00"),
(3,"San expedito","Transferencia",34569896,"sa_expedito@hotmail.com","Concordia","2023-07-04 07:00:00"),
(4,"Guerrero","Transferencia",34578741,"GuerreroSA@hotmaill.com","Chajari","2002-04-04 07:00:00"),
(5,"Doltmat","Transferencia",345754124,"info_dolmat@gmail.com.ar","Concordia","2022-01-28 07:00:00");

INSERT INTO Proyectos (Id, Nombre, Tiempo_ejecucion, Cliente, Monto_de_obra) VALUES
(1,"VIVIENDA",8, "Nacion",700000),
(2,"PISTA",24,"Nacion",350000000),
(3,"RED_CLOACAL", 48,"Provincia", 300000000);

INSERT INTO items (Id,Proyectos_Id, Nombre,Periodo_dias,Fecha_inicio) VALUES 
(1,1,"Desmonte y compactacion  de suelo",7,"23-05-01 07:00:00"),
(2,2,"Desmonte y compactacion  de suelo",14,"2023-06-03 07:00:00"),
(3,3,"Liempieza suelo vegetal",35,"2023-08-01 07:00:00"),
(4,1,"Zapatas de hormigon armado",14,"2023-05-08 07:00:00"),
(5,2,"Relleno con suelo seleccionado",20,"2023-06-17 07:00:00"),
(6,3,"Desmonte suelo existente",60,"2023-09-05 07:00:00"),
(7,1,"Viga de fundacion",10,"2023-05-22 07:00:00"),
(8,2,"Colocacion suelo cemento",35, "2023-07-07 07:00:00"),
(9,3,"Ejecuccion de caños d6e cloaca",45,"2023-11-04 07:00:00"),
(10,1,"Columnas",25,"2023-06-01 07:00:00"),
(11,2,"Ejecucion de Pavimento de asfalto",35,"2023-08-11 07:00:00"),
(12,3,"Relleno y compactacion con suelo seleccionado",45,"2023-12-19 07:00:00"),
(13,1,"Techo",20,"2023-06-26 07:00:00"),
(14,2,"Señalizacion horizontal y vertical",14,"2023-09-15 07:00:00"),
(15,3,"Nivelacion de terreno y señalizacion",10,"2024-02-02 07:00:00");

 INSERT INTO materiales (Id,Items_Id, Proveedores_Id,Nombre,Unidad,Cantidad) VALUES 
 (1,1,3,"Estaca","Unidad",25),
 (2,3,3,"Cinta_de_Peligro","Unidad",10),
 (3,1,1,"Carteles_conos_iluminacion","General",1),
 (4,10,3,"Fenolico","m2",20),
 (5,11,2,"Asfalto_liquido","m3",5),
 (6,9,4,"Caño_600","ml",200),
 (7,9,1,"Canto_rodado","m3",34),
 (8,10,2,"Puntales","Unidad",87),
 (9,3,4,"Estaca","Unidad",200),
 (10,2,2,"Cinta_de_peligro","Unidad",54),
 (11,4,4,"varilla_hierr0_6mm","Unidad",54),
 (12,4,5,"Arena","m3",12),
 (13,10,4,"Canto_rodado","General",35),
 (14,8,5,"Cemento","Kg",400),
 (15,9,2,"Caño_codo_45","Unidad",87);

 INSERT INTO Empleados (Id,nombre,Dni, Mail, Fecha_inscripcion) VALUES
(1,"Javier_milei", 23422433,"javier@gmail.com","2021-12-14"),
(2,"Juan_casas",23432123,"javier@hotmail.com","2021-12-01"),
(3,"Mario_Arellano",40987546,"Mario@gmail.com","2021-01-13"),
(4,"Federico_Donatti",36121324,"federico@gmail.com","2021-04-05"),
(5,"Fernando_Tarabine",37456354,"fernando@hotmail.com","2021-01-07"),
(6,"justo_dome", 23422433,"jr@gmail.com","2021-02-14"),
(7,"Juan_Arellano",23432143,"jar@hotmail.com","2022-12-01"),
(8,"justiniano_danis",50987546,"rio@gmail.com","2021-01-03"),
(9,"Ricardo_gomez",25032111,"riqui@gmail.com","2021-02-04"),
(10,"Daniel_Eiroa",15000331,"Eldanie@hotmail.com.ar","2022-03-29"),
(11,"Julio_micle",40837231,"julioo@gmail.com","2001-11-15"),
(12,"Gonzalo_spinso",23100321,"gonzaa@hotmail.com","1995-07-03");


 INSERT INTO Categorias (Id,Categoria) VALUES
 (1,"Ayudante"),
 (2,"Medio_oficial"),
 (3,"Oficial"),
 (4,"Capataz");

INSERT INTO personal_civil( Id, Id_Empleados, Id_Categorias, Gremialista) VALUES
(1,2,4,1),
(2,4,1,1),
(3,3,4,0),
(4,1,3,1),
(5,5,1,1),
(6,6,2,1);

INSERT INTO Jornadas_laborales (Id,Periodo_laboral_dias,Periodo_franco_dias,Hora_ingreso) VALUES  
(1,14,2,"07:00:00"),
(2,14,2,"18:00:00");

INSERT INTO Mano_de_obra (Id,Items_Id,Jornadas_labores_Id,Id_Personal_civil) VALUES 
(1,2,1,1),
(2,15,1,2),
(3,15,1,4),
(4,15,1,5),
(5,4,2,3),
(6,13,2,6);

INSERT INTO Subcontratistas (Id,Razon_social,Forma_de_pago,Telefono,Mail,Ubicacion,Fecha_inscripcion,Tipo_de_servicio) VALUES
  (1,"Grinac","transferencia",3452178,"inf_grinac@gmail.com","Concordia","2021-01-22 07:00:00","Excavacion_suelo_m3"),
  (2,"Vechio","Transferencia",3457874,"vecchio_info@gmail.com","Concordia","2021-03-14 07:00:00","Hormigon_elaborado_m3"),
  (3,"La_hormigonera","Efectivo",34510012,"servicio@hotmail.com","Concordia","2021-10-05 07:00:00","Hormigon_elaborado_m3"),
  (4,"Electrotech","Cheque_60_dias",3425697,"electro@hotmail.com","Chajari","2021-12-12 07:00:00","Servicio_electrico_general"),
  (5,"Russo","Cheque_a_15dias",3455733,"info_russo@hotmail.com","Concordia","2021-12-12 07:00:00","Servicio_electrico_general");
  
INSERT INTO Servicios_subcontratistas(Id,Items_Id,Subcontratistas_Id,Unidad,Cantidad,Detalle_de_actividad) VALUES
  (1,2,1,"m3",800,"Excavacion de suelo en el area de la futura pista, hasta llegar a cota"),
  (2,4,2,"m3",12,"Hormigon elaborado para el llenado de zapatas"),
  (3,1,4,"general",1,"Instalacion general electrica en el obrador, zona de edificacion"),
  (4,7,2,"m3",24,"Hormigon elaborado ára el llenado de viga de fundacion"),
  (5,10,2,"m3",15,"Hormigon elaborado para el llenado de columnas");  

INSERT INTO Maquinas(Id,Tipo_de_maquina,Capacidad_tanque_litros,Marca,Rendimiento_LxDia,Tipo_combustible) VALUES
  (1,"Retroexcavadora_neumatica",250,"komat´su",110,"Gasoil"),
  (2,"Retroexcavadora_oruga",200,"Caterpillar",110,"Euro5"),
  (3,"Motoniveladora",150,"Caterpillar",60,"Nafta"),
  (4,"Motoniveladora",150,"Hyundai",80,"Gasoil"),
  (5,"Topadora",250,"John_deere",200,"Gasoil"),
  (6,"Compactador_liso",160,"Hyundai",70,"Nafta"),
  (7,"Compactadora_pata_cabra",120,"Sany",50,"Euro5"),
  (8,"Frezadora",700,"komat'su",380,"Euro5"),
  (9,"Camion_tatu",100,"Komat'su",50,"Nafta"),
  (10,"Camion_tatu",100,"Ford",50,"Nafta"),
  (11,"Camion_tatu",100,"Ford",50,"Nafta"),
 (12,"Camion_tatu",100,"Ford",50,"Nafta");
 
INSERT INTO personal_vial(Id,Id_Empleados,Fecha_carnet_conducir_actualizado,Fecha_carnet_medico_actualizado,Condicion_medica_habilitada,Condicion_conductor_habilitado) VALUES
  (1,7,"2022-01-23","2022-01-10",1,1),
  (2,12,"2021-02-22","2023-01-21",1,1),
  (3,10,"2022-03-11","2023-11-11",1,1),
  (4,11,"2022-02-01","2022-07-03",1,1),
  (5,8,"2022-05-09","2021-03-04",1,1),
  (6,9,"2021-09-09","2021-08-23",1,1);

INSERT INTO equipos(Id,Maquinas_Id,Jornadas_laborales_Id,Items_Id,Id_Personal_vial) VALUES
(1,1,2,5,1),
(2,2,1,5,2),
(3,3,1,5,6),
(4,4,1,5,5),
(5,10,2,5,4),
(6,12,1,5,3);




 


