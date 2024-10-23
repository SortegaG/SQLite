-- Crear tabla CAMPUS 
CREATE TABLE campus (
  campus_id serial NOT NULL PRIMARY KEY, 
  campus_nombre varchar(45) NOT NULL
);

-- Crear tabla PROMOCION
CREATE TABLE promocion (
  promocion_id serial NOT NULL PRIMARY KEY,
  promocion_nombre varchar(45) NOT NULL
);

-- Crear tabla VERTICAL
CREATE TABLE vertical (
  vertical_id serial NOT NULL PRIMARY KEY, 
  vertical_name varchar(45) NOT NULL
);

-- Crear tabla MODALIDAD
CREATE TABLE modalidad (
  modalidad_id serial NOT NULL PRIMARY KEY, 
  mes varchar(45) NOT NULL, 
  fecha date NOT NULL
);

-- Crear tabla ALUMNOS
CREATE TABLE alumnos (
  id_alumno serial NOT NULL PRIMARY KEY, 
  name varchar(45) NOT NULL, 
  surname varchar(45) NOT NULL, 
  email varchar(100) NOT NULL UNIQUE,
  bootcamp_id integer NOT NULL,
  campus_id integer NOT NULL,
  promocion_id integer NOT NULL,
  modalidad_id integer NOT NULL,
  vertical_id integer NOT NULL,
  CONSTRAINT fk_campus FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_promocion FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_modalidad FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id),
  CONSTRAINT fk_vertical FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id)
);

-- Crear tabla PROYECTOS
CREATE TABLE proyectos (
  proyecto_id serial NOT NULL PRIMARY KEY, 
  proyecto_nombre varchar(45) NOT NULL, 
  vertical_id integer NOT NULL,
  CONSTRAINT fk_vertical_proyectos FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id)
);

-- Crear tabla CALIFICACION
CREATE TABLE calificacion (
  id_alumno integer NOT NULL, 
  proyecto_id integer NOT NULL,
  nota varchar(45) NOT NULL,
  PRIMARY KEY (id_alumno, proyecto_id),  -- Composite primary key
  CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
  CONSTRAINT fk_proyecto FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla CLAUSTRO
CREATE TABLE claustro (
  claustro_id serial NOT NULL PRIMARY KEY, 
  claustro_name varchar(45) NOT NULL, 
  vertical_id integer NOT NULL, 
  promocion_id integer NOT NULL,
  campus_id integer NOT NULL,
  modalidad_id integer NOT NULL,
  CONSTRAINT fk_vertical_claustro FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_promocion_claustro FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_campus_claustro FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_modalidad_claustro FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id)
);
