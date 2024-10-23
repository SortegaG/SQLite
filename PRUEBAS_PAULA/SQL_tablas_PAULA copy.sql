CREATE TABLE alumno (
  id_alumno serial NOT NULL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  email varchar(100) NOT NULL UNIQUE,
  id_campus int,
  id_promocion int,
  id_modalidad int,
  id_vertical int,
  id_ta int,
  FOREIGN KEY (id_campus) REFERENCES campus(id_campus),
  FOREIGN KEY (id_promocion) REFERENCES promocion(id_promocion),
  FOREIGN KEY (id_modalidad) REFERENCES modalidad(id_modalidad),
  FOREIGN KEY (id_vertical) REFERENCES vertical(id_vertical),
  FOREIGN KEY (id_ta) REFERENCES ta(id_ta)
);



CREATE TABLE campus (
  id_campus serial NOT NULL PRIMARY KEY,
  campus_nombre varchar(100) NOT NULL
);



CREATE TABLE claustro (
  id_claustro serial NOT NULL PRIMARY KEY,
  claustro_name varchar(100) NOT NULL,
  id_campus int,
  id_modalidad int,
  id_vertical int,
  FOREIGN KEY (id_campus) REFERENCES campus(id_campus),
  FOREIGN KEY (id_modalidad) REFERENCES modalidad(id_modalidad),
  FOREIGN KEY (id_vertical) REFERENCES vertical(id_vertical)
);



CREATE TABLE modalidad (
  id_modalidad serial NOT NULL PRIMARY KEY,
  mes varchar(20),
  fecha date
);



CREATE TABLE promocion (
  id_promocion serial NOT NULL PRIMARY KEY,
  nombre varchar(100) NOT NULL
);



CREATE TABLE proyectos (
  id_proyecto serial NOT NULL PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  id_vertical int,
  id_alumno int,
  id_promocion int,
  calificacion decimal(5,2),
  fecha_inicio date,
  fecha_entrega date,
  estado varchar(50),
  FOREIGN KEY (id_vertical) REFERENCES vertical(id_vertical),
  FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
  FOREIGN KEY (id_promocion) REFERENCES promocion(id_promocion)
);



CREATE TABLE ta (
  id_ta serial NOT NULL PRIMARY KEY,
  id_claustro int,
  FOREIGN KEY (id_claustro) REFERENCES claustro(id_claustro)
);



CREATE TABLE li (
  id_li serial NOT NULL PRIMARY KEY,
  id_claustro int,
  FOREIGN KEY (id_claustro) REFERENCES claustro(id_claustro)
);



CREATE TABLE vertical (
  id_vertical serial NOT NULL PRIMARY KEY,
  vertical_name varchar(100) NOT NULL
);





