use facultad;
select * from inscripciones_cursada;
INSERT INTO departamentos (Departamento_ID, nombre, Descripcion) VALUES
(1, "INGENIERIA CIVIL","Financiado por ministerio de educacion,Creacion:1974"),
(2, "INGENIERIA ELECTROMECANICA", "Financiado por ministerio de educacion,Creacion: 1967"),
(3, "MATERIAS BASICAS", "Financiada por ministerio, Creacion:1967");

insert into Estudiantes (Estudiante_ID, Nombre, Apellido, Fecha_nacimiento, Direccion, Correo) values 
(1, 'Giulia', 'Trenaman', "1992-12-15", '0055 Logan Avenue', 'gtrenaman0@qq.com'),
(2, 'Rosabel', 'Pridding', "1992-12-22", '1071 Armistice Point', 'rpridding1@oracle.com'),
(3, 'Marijo', 'Tuke', '1993-01-20', '3549 Rigney Drive', 'mtuke2@barnesandnoble.com'),
(4, 'Anitra', 'Hover', '1997-08-31', '25 Killdeer Avenue', 'ahover3@ameblo.jp'),
(5, 'Emyle', 'Kibel', '1990-05-04', '57 Esch Park', 'ekibel4@odnoklassniki.ru'),
(6, 'Adan', 'Josifovic', '1997-05-09', '7 Mariners Cove Terrace', 'ajosifovic5@squarespace.com'),
(7, 'Kaylyn', 'Waddam', '1992-10-11', '91 Killdeer Way', 'kwaddam6@china.com.cn'),
(8, 'Berri', 'Wearing', '1990-12-12', '0 8th Street', 'bwearing7@tmall.com'),
(9, 'Yasmin', 'Volette', '1993-08-06', '95 Eliot Place', 'yvolette8@wikispaces.com'),
(10, 'Madelina', 'Briston', '1998-12-09', '290 Schmedeman Crossing', 'mbriston9@wsj.com'),
(11, 'Dreddy', 'Sailer', '1996-01-31', '47 Tony Circle', 'dsailera@w3.org'),
(12, 'Leslie', 'Tanslie', '1995-12-13', '89 Nancy Plaza', 'ltanslieb@gizmodo.com'),
(13, 'Gabrila', 'Keeney', '1995-10-31', '74 Katie Parkway', 'gkeeneyc@ebay.com'),
(14, 'Hazel', 'Touson', '1990-04-27', '7234 Katie Terrace', 'htousond@sbwire.com'),
(15, 'Kesley', 'Polycote', '1993-07-14', '48 Sullivan Street', 'kpolycotee@slashdot.org'),
(16, 'Jsandye', 'Dunbleton', '1995-03-29', '9199 Little Fleur Road', 'jdunbletonf@imgur.com'),
(17, 'Zena', 'Rumney', '1994-11-10', '5364 Petterle Terrace', 'zrumneyg@disqus.com'),
(18, 'Gratiana', 'Zanicchi', '1996-06-09', '7575 Delaware Court', 'gzanicchih@newsvine.com'),
(19, 'Kitty', 'Feldharker', '1990-07-28', '60110 Canary Lane', 'kfeldharkeri@elpais.com'),
(20, 'Pearline', 'Aubert', '2000-04-04', '29 Gale Way', 'paubertj@godaddy.com'),
(21, 'Mario', 'casalaspro', '1980-03-01', '9 de julio', 'casalaspro@godaddy.com'),
(22,'Marina', 'Peralta', '1992-03-04', 'gallay 20', 'pietro@gmail.com'),
(23,'Fernando', 'Peralta', '1993-04-04', '', 'pool@gmail.com'),
(24,'Martin', 'erra', '1987-10-04', '25 de mayo', 'pollitos@hotmail.com'),
(25,'Ricardo', 'gomez', '1901-01-28', 'Los brettes 2233', 'erramuspe@hotmail.com'),
(26,'juan', 'razedo', '1993-09-04', 'El abasto 1022', 'pime@hotmail.com'),
(27,'Brian', 'soria', '1980-01-04', 'Urquiza 2001', 'soria@hotmail.com'),
(28,'Martin', 'erra', '1987-10-04', '25 de mayo', 'polltos@hotmail.com'),
(29,'Celeste', 'Perez', '1992-07-11', 'Parque San Carlos', 'Cele_perez@hotmail.com'),
(30,'Soledad', 'Pereira', '1991-03-23', 'San Lorenzo 111', 'Sole_la_mejor@hotmail.com'),
(31,'Victoria', 'Sac', '1987-10-04', '25 de agosto 931', 'Victoria@hotmail.com'),
(32,'Martin', 'Monzon', '1993-02-04', 'Belgrano 333', 'Monzon_el@hotmail.com'),
(33,'Ramon', 'Barreto', '1988-10-10', '25 de mayo 22', 'barreto@hotmail.com'),
(34,'Ramiro', 'golleneche', '1992-11-04', 'Calle 233 ', 'golle@gmail.com'),
(35,'Victorias','Velland', '1987-10-04', 'Calle 37547315', 'Concepcion@hotmail.com');

INSERT INTO profesores (Profesor_ID, Nombre, Apellido, Fecha_nacimiento, Direccion, Correo) VALUES
(1, 'Lorraine', 'Rosendale', '1985-07-07', '080 Mockingbird Place', 'lrosendale0@apache.org'),
(2, 'Ilka', 'Arnao', '1977-11-16', '82 Old Gate Trail', 'iarnao1@jigsy.com'),
(3, 'Catharina', 'Crippen', '1988-09-17', '6467 Fallview Parkway', 'ccrippen2@constantcontact.com'),
(4, 'Dorette', 'Grinnov', '1979-09-24', '121 Scott Hill', 'dgrinnov3@vkontakte.ru'),
(5, 'Emeline', 'Myhan', '1988-01-10', '7878 Erie Crossing', 'emyhan4@bloomberg.com'),
(6, 'Georgina', 'Kernell', '1973-07-19', '208 Cascade Point', 'gkernell5@cdbaby.com'),
(7, 'Julieta', 'Wandrich', '1981-12-14', '6250 Farmco Way', 'jwandrich6@webs.com'),
(8, 'Gianina', 'Gibbard', '1976-04-17', '46060 Vidon Way', 'ggibbard7@whitehouse.gov'),
(9, 'Janice', 'Verny', '1986-09-12', '064 Pepper Wood Terrace', 'jverny8@forbes.com'),
(10, 'Rubi', 'East', '1971-06-05', '475 Vidon Lane', 'reast9@wikia.com'),
(11, 'Beret', 'Fiorentino', '1984-12-09', '5 Maple Wood Plaza', 'bfiorentinoa@usda.gov'),
(12, 'Jan', 'Littledike', '1989-10-13', '2496 Canary Drive', 'jlittledikeb@live.com');

INSERT INTO aulas (Aula_ID,Nombre_aula,Capacidad) VALUES
(1,32,70),
(2,33,30),
(3,34,65),
(4,35,25),
(5,36,35),
(6,37,45),
(7,38,20),
(8,40,23),
(9,45,30),
(10,50,60);

INSERT INTO periodo_cursada (periodo_cursada_ID,nombre) VALUES
(1,"Primer_cuatrimestre"),
(2,"Segundo_cuatrimestre"),
(3,"Anual");

INSERT INTO materias (Materia_ID,Departamento_ID,Nivel,Periodo_cursada_ID,Asignatura, Carga_horaria, Cursadas_necesarias,N°_clases) VALUES
(1,3,1,1,"Álgebra y Geometría Analítica",10,"0",32),
(2,3,1,1,"Análisis Matemático I",10,"0",32),
(3,3,1,2,"Química General",10,"0",32),
(4,3,1,2,"Física I",10,"0",32),
(5,3,2,1,"Análisis Matemático II",10,"0",32),
(6,3,2,2,"Física II",10,"0",32),
(7,3,2,2,"Probabilidad y Estadística",6,"0",32),
(8,3,2,3,"Inglés I",2,"0",16),
(9,3,3,2,"Economía",6,"0",16),
(10,3,3,3,"Inglés II",2,"0",32),
(13, 1, 1, 1, 'Ingeniería y Sociedad', 4, "0",16),
(14, 1, 1, 2, 'Fundamentos de Informática', 4, "0",16),
(15, 1, 1, 3, 'Sistemas de Representación', 3, "0",16),
(16, 1, 1, 3, 'Ingeniería Civil I', 3, "0",32),
(17, 1, 2, 1, 'Estabilidad', 10, '1-2-5-6-7',32),
(18, 1, 2, 2, 'Geología Aplicada', 4, '4-5-8',16),
(19, 1, 2, 3, 'Tecnología de los Materiales', 4, '2-4-5-7',32),
(20, 1, 2, 3, 'Ingeniería Civil II (integradora)', 3, '3-6-7-8',32),
(21, 1, 3, 1, 'Resistencia de Materiales', 8, '10',32),
(22, 1, 3, 1, 'Hidráulica General y Aplicada', 10, '9-10-11-12-16',32),
(23, 1, 3, 1, 'Tecnología del Hormigón', 4, '12-14-15',16),
(24, 1, 3, 2, 'Geotopografía', 8, '9-11-12-16',16),
(25, 1, 3, 2, 'Instalaciones Eléctricas y Acústicas', 4, '11-14-16',16),
(26, 1, 3, 2, 'Instalaciones Termomecánicas', 4, '11-14-16',16),
(27, 1, 3, 3, 'Tecnología de la Construcción', 6, '10-14-15-16',32),
(28, 1, 4, 1, 'Instalaciones Sanitarias y de Gas', 6, '18-20-24-25',32),
(29, 1, 4, 1, 'Análisis Estructural I', 10, '17-19',32),
(30, 1, 4, 1, 'Estructuras de Hormigón', 10, '17-19-20-25-26',32),
(31, 1, 4, 2, 'Geotecnia', 10, '17-18-19-20-25',32),
(32, 1, 4, 2, 'Hidrología y Obras Hidráulicas', 8, '17-18-20-24-25-26',32),
(33, 1, 4, 3, 'Diseño Arquitectónico y Planeamineto I', 5, '20-22-23-24-25-26',32),
(34, 1, 5, 1, 'Construcciones Metálicas y de Madera', 8, '21-28',32),
(35, 1, 5, 1, 'Cimentaciones', 6, '21-28-29-30-31',32),
(36, 1, 5, 1, 'Ingeniería Sanitaria', 6, '27-30-31',32),
(37, 1, 5, 1, 'Vías de Comunicación I', 8, '19-20-25',32),
(38, 1, 5, 1, 'Gestión Ambiental y Desarrollo Sustentable', 6, '30-31-32-33',32),
(39, 1, 5, 1, 'Elasticidad y Plasticidad', 6, '9-21',32),
(40, 1, 5, 1, 'Prefabricación', 2, '14-29',16),
(41, 1, 5, 2, 'Análisis Estructural II', 10, '21-28-29-30-31',32),
(42, 1, 5, 2, 'Vías de Comunicación II', 8, '29-30-31-32-37',32),
(43, 1, 5, 2, 'Análisis Estructural III', 4, '39-41',16),
(44, 1, 5, 2, "Diseño Arquitectónico y de Planeamiento II",3,"33",16),
(45, 1, 5, 2, "Gestión de la Responsabilidad Social ",4,"24-32",16),
(46, 1, 5, 3, "Organización y Conducción de Obras",10,"27-29-30-31-33",32),
(47, 1, 6, 1, "Puentes",5, "35-41",32),
(48, 1, 6, 1, "Obras Fluviales y Marítimas", 6,"35-41",32),
(49, 1, 6, 3, "Proyecto Final (integradora)",4,"27-28-29-30-31-32-33",16),
(50, 1, 3, 2, "Calculo avanzado",4,"0",16),
(51, 1, 4, 2, "Ingenieria legal",6, "9-12-15-16",32),
(52,1,5,2, "Introduccion a la investigacion",4, "24-32",16),
(53, 2, 1, 1, 'Sistemas de Representación', 6, '0',16),
(54, 2, 1, 2, 'Ingeniería y Sociedad', 4, '0',16),
(55, 2, 1, 2, 'Representación Gráfica', 6, '0',16),
(56, 2, 1, 3, 'Ingeniería Electromecánica I', 2, '0',16),
(57, 2, 2, 2, 'Programación en Computación', 6, '1-2',32),
(58, 2, 2, 2, 'Conocimiento de Materiales', 8, '4',32),
(59, 2, 2, 3, 'Estabilidad', 6, '1-2-6',32),
(60, 2, 2, 3, 'Ingeniería Electromecánica II', 2, '1-2-8',16),
(61, 2, 3, 1, 'Tecnología Mecánica', 10, '11-13',16),
(62, 2, 3, 1, 'Matemática para Ingeniería Electromecánica', 6, '6',32),
(63, 2, 3, 2, 'Mecánica y Mecanismos', 8, '7-9-14',32),
(64, 2, 3, 2, 'Higiene y Seguridad Industrial', 4, '11',16),
(65, 2, 3, 2, 'Oleohidráulica y Neumática', 4, '11',32),
(66, 2, 3, 3, 'Electrotecnia', 6, '9-11',16),
(67, 2, 3, 3, 'Termodinámica Técnica', 4, '11',32),
(68, 2, 3, 3, 'Ingeniería Electromecánica III', 3, '9-11-16',32),
(69, 2, 4, 1, 'Máquinas Térmicas', 10, '24',32),
(70, 2, 4, 1, 'Mediciones Eléctricas', 8, '18-22',16),
(71, 2, 4, 2, 'Electrónica Industrial', 6, '22',32),
(72, 2, 4, 2, 'Diseño y Fabricación Asistido por Computadora', 4, '13-17-19',32),
(73, 2, 4, 2, 'Ingeniería de Superficies', 6, '0',32),
(74, 2, 4, 2, 'Legislación', 4, '16',32),
(75, 2, 4, 3, 'Elementos de Máquinas', 6, '17-19-25',16),
(76, 2, 4, 3, 'Máquinas Eléctricas', 5, '22',16),
(77, 2, 4, 3, 'Mecánica de los Fluidos y Máquinas', 5, '19-24',32),
(78, 2, 5, 1, 'Máquinas y Equipos de Transporte', 4, '21-28-33-35',32),
(79, 2, 5, 1, 'Gestión y Mantenimiento Electromecánico', 4, '21-28-34-35',16),
(80, 2, 5, 1, 'Organización Industrial', 6, '26-29',32),
(81, 2, 5, 1, 'Automatización y Control Industrial', 6, '18-33-28-34-35',16),
(82, 2, 5, 1, 'Introducción al Proyecto', 6, '0',16),
(83, 2, 5, 1, 'Electrónica de Potencia', 4, '27-28',32),
(84, 2, 5, 1, 'Ambiental', 4, '29-32',16),
(85, 2, 5, 2, 'Instalaciones Térmicas y Mecánicas', 6, '27-28',16),
(86, 2, 5, 2, 'Centrales y Sistemas de Transmisión', 10, '27-28-34-35',32),
(87, 2, 5, 2, 'Automatismos', 8, '39-41',32),
(88, 2, 5, 2, 'Emprendedorismo', 4, '38',16),
(89, 2, 5, 2, 'Introducción a la Investigación Científica', 4, '16',32),
(90, 2, 5, 2, 'Instalaciones Industriales Regionales', 6,"40",32),
(91, 2, 5, 3, 'Redes de Distribución', 5, '34-35',16),
(92, 2, 5, 3, 'Proyecto Final (integradora)', 3, '23-27-28-35',32);

INSERT INTO cuatrimestre (Cuatrimestre_ID,Designacion_cuatrimestral,Fecha_inicio,Fecha_finalizacion) VALUES
(1,1,'2019-03-04', '2019-07-04'),
(2,2,'2019-08-05', '2019-12-12'),
(3,1,'2020-03-02','2020-07-02');

INSERT INTO horarios (Horario_ID,Dia_de_la_semana,Hora_inicio,Hora_finalizacion,MATERIA_ID) VALUES
(1,"Lunes",'07:30:00','12:00:00',2),
(2,"Viernes",'07:30:00','12:00:00',2),
(3,"Martes",'07:30:00','12:00:00',1),
(4,"Jueves",'07:30:00','12:00:00',1),
(5,"Lunes",'15:00:00','19:00:00',13),
(6,"Miercoles",'08:00:00','11:00:00',15),
(7,"Miercoles",'15:00:00','18:00:00',16),
(8,"Lunes",'07:30:00','12:00:00',4),
(9,"Viernes",'07:30:00','12:00:00',4),
(10,"Martes",'07:30:00','12:00:00',3),
(11,"Jueves",'07:30:00','12:00:00',3);
select * from curso;
select * from estudiantes;
INSERT INTO curso (Curso_ID,Materia_ID,Aula_ID,Profesor_ID,Cuatrimestre_ID) VALUES
(1,1,10,5,1),
(2,2,1,9,1),
(3,3,10,1,2),
(4,4,9,2,2),
(5,15,6,3,3),
(6,16,5,4,3),
(7,13,6,6,1),
(8,14,5,7,2),
(9,5,5,12,1),
(10,17,9,11,1),
(11,19,2,1,3),
(12,20,7,10,3),
(13,8,8,8,3),
(14,6,3,2,2),
(15,7,9,1,2),
(16,18,2,10,2);
select *  from inscripciones_cursada;
INSERT INTO inscripciones_cursada (Inscripcion_ID,Estudiante_ID,Curso_ID) VALUES
(1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),
(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),
(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),
(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),
(21,1,2),(22,2,2),(23,3,2),(24,4,2),(25,5,2),
(26,6,2),(27,7,2),(28,8,2),(29,9,2),(30,10,2),
(31,11,2),(32,12,2),(33,13,2),(34,14,2),(35,15,2),
(36,16,2),(37,17,2),(38,18,2),(39,19,2),(40,20,2),
(41,1,3),(42,2,3),(43,3,3),(44,4,3),(45,5,3),
(46,6,3),(47,7,3),(48,8,3),(49,9,3),(50,10,3),
(51,11,3),(52,12,3),(53,13,3),(54,14,3),(55,15,3),
(56,16,3),(57,17,3),(58,18,3),(59,19,3),(60,20,3),
(61,1,3),(62,2,3),(63,3,3),(64,4,3),(65,5,3),
(66,6,3),(67,7,3),(68,8,3),(69,9,3),(70,10,3),
(71,11,3),(72,12,3),(73,13,3),(74,14,3),(75,15,3),
(76,16,3),(77,17,3),(78,18,3),(79,19,3),(80,20,3),
(81,1,4),(82,2,4),(83,3,4),(84,4,4),(85,5,4),
(86,6,4),(87,7,4),(88,8,4),(89,9,4),(90,10,4),
(91,11,4),(92,12,4),(93,13,4),(94,14,4),(95,15,4),
(96,16,4),(97,17,4),(98,18,4),(99,19,4),(100,20,4),
(101,1,5),(102,2,5),(103,3,5),(104,4,5),(105,5,5),
(106,6,5),(107,7,5),(108,8,5),(109,9,5),(110,10,5),
(111,11,5),(112,12,5),(113,13,5),(114,14,5),(115,15,5),
(116,16,5),(117,17,5),(118,18,5),(119,19,5),(120,20,5),
(121,1,6),(122,2,6),(123,3,6),(124,4,6),(125,5,6),
(126,6,6),(127,7,6),(128,8,6),(129,9,6),(130,10,6),
(131,11,6),(132,12,6),(133,13,6),(134,14,6),(135,15,6),
(136,16,6),(137,17,6),(138,18,6),(139,19,6),(140,20,6),
(141,1,7),(142,2,7),(143,3,7),(144,4,7),(145,5,7),
(146,6,7),(147,7,7),(148,8,7),(149,9,7),(150,10,7),
(151,11,7),(152,12,7),(153,13,7),(154,14,7),(155,15,7),
(156,16,7),(157,17,7),(158,18,7),(159,19,7),(160,20,7),
(161,1,8),(162,2,8),(163,3,8),(164,4,8),(165,5,8),
(166,6,8),(167,7,8),(168,8,8),(169,9,8),(170,10,8),
(171,11,8),(172,12,8),(173,13,8),(174,14,8),(175,15,8),
(176,16,8),(177,17,8),(178,18,8),(179,19,8),(180,20,8),
(181,21,9),(182,22,9),(183,23,9),(184,24,9),(185,25,9),(186,26,9),(187,27,9),(188,28,9),(189,29,9),(190,30,9),(191,31,9),(192,32,9),(193,33,9),(194,34,9),(195,35,9),
(196,21,10),(197,22,10),(198,23,10),(199,24,10),(200,25,10),(201,26,10),(202,27,10),(203,28,10),(204,29,10),(205,30,10),(206,31,10),(207,32,10),(208,33,10),(209,34,10),(210,35,10),
(211,21,11),(212,22,11),(213,23,11),(214,24,11),(215,25,11),(216,26,11),(217,27,11),(218,28,11),(219,29,11),(220,30,11),(221,31,11),(222,32,11),(223,33,11),(224,34,11),(225,35,11),
(226,21,12),(227,22,12),(228,23,12),(229,24,12),(230,25,12),(231,26,12),(232,27,12),(233,28,12),(234,29,12),(235,30,12),(236,31,12),(237,32,12),(238,33,12),(239,34,12),(240,35,12),
(241,21,13),(242,22,13),(243,23,13),(244,24,13),(245,25,13),(246,26,13),(247,27,13),(248,28,13),(249,29,13),(250,30,13),(251,31,13),(252,32,13),(253,33,13),(254,34,13),(255,35,13),
(256,21,14),(257,22,14),(258,23,14),(259,24,14),(260,25,14),(261,26,14),(262,27,14),(263,28,14),(264,29,14),(265,30,14),(266,31,14),(267,32,14),(268,33,14),(269,34,14),(270,35,14),
(271,21,15),(272,22,15),(273,23,15),(274,24,15),(275,25,15),(276,26,15),(277,27,15),(278,28,15),(279,29,15),(280,30,15),(281,31,15),(282,32,15),(283,33,15),(284,34,15),(285,35,15),
(286,21,16),(287,22,16),(288,23,16),(289,24,16),(290,25,16),(291,26,16),(292,27,16),(293,28,16),(294,29,16),(295,30,16),(296,31,16),(297,32,16),(298,33,16),(299,34,16),(300,35,16);
INSERT INTO horarios (Horario_ID,Dia_de_la_semana,Hora_inicio,Hora_finalizacion,MATERIA_ID) VALUES
(12,"Lunes",'08:00:00','13:00:00',17),
(13,"Miercoles",'08:00:00','13:00:00',17),
(14,"Lunes",'08:00:00','13:00:00',5),
(15,"Viernes",'18:00:00','23:00:00',5),
(16,"Jueves",'19:00:00','23:00:00',19),
(17,"Jueves",'08:00:00','10:00:00',8),
(18,"Miercoles",'08:00:00','11:00:00',20),
(19,"Lunes",'08:00:00','13:00:00',6),
(20,"Viernes",'08:00:00','13:00:00',6),
(21,"Lunes",'19:00:00','23:00:00',18),
(22,"Martes",'15:00:00','18:00:00',7),
(23,"Miercoles",'15:00:00','18:00:00',7);