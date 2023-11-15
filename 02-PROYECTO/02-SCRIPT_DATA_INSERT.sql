use facultad;
select*
from estudiantes;
DELETE FROM estudiantes WHERE estudiante_id>=1;

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
(20, 'Pearline', 'Aubert', '2000-04-04', '29 Gale Way', 'paubertj@godaddy.com');

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

INSERT INTO departamentos (Departamento_ID, nombre, Descripcion) VALUES
(1, "INGENIERIA CIVIL","Financiado por ministerio de educacion,Creacion:1974"),
(2, "INGENIERIA ELECTROMECANICA", "Financiado por ministerio de educacion,Creacion: 1967"),
(3, "MATERIAS BASICAS", "Financiada por ministerio, Creacion:1967");
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
INSERT INTO carreras (carrera_ID, Nombre_carrera, descripticion, Departamento_ID) VALUES
(1,"Ingenieria civil","Carreara de grado",1),
(2,"Ingenieria electromecanica","Carreara de grado",2);



