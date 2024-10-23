-- Crear tabla ALUMNOS
CREATE TABLE alumnos (
  id_alumno serial NOT NULL PRIMARY KEY, 
  name varchar(45) NOT NULL, 
  surname varchar(45) NOT NULL, 
  email varchar(100) NOT NULL UNIQUE,
  bootcamp_id integer NOT NULL,
  campus_id integer NOT NULL,
  promocion_id integer NOT NULL
  modalidad varchar(45) NOT NULL,
  vertical_id integer NOT NULL
);

-- Crear tabla CAMPUS 
CREATE TABLE promocion (
  campus_id serial NOT NULL PRIMARY KEY, 
  campus_nombre varchar(45) NOT NULL
);

-- Crear tabla VERTICAL
CREATE TABLE vertical (
  vertical_id serial NOT NULL PRIMARY KEY, 
  vertical_name varchar(45) NOT NULL
);

-- Crear tabla PROYECTOS
CREATE TABLE proyectos (
  proyecto_id serial NOT NULL PRIMARY KEY, 
  proyecto_nombre varchar(45) NOT NULL, 
  vertical_id varchar(45) NOT NULL

-- Crear tabla CALIFICACION
CREATE TABLE calificacion (
  id_alumno integer NOT NULL, 
  proyecto_id integer NOT NULL,
  nota varchar(45) NOT NULL
);

-- Crear tabla MODALIDAD
CREATE TABLE modalidad (
  modalidad_id serial NOT NULL PRIMARY KEY, 
  mes varchar(45) NOT NULL, 
  fecha date NOT NULL, 
);

-- Crear tabla CLAUSTRO
CREATE TABLE claustro (
  claustro_id serial NOT NULL PRIMARY KEY, 
  calustro_name varchar(45) NOT NULL, 
  vertical_id integer NOT NULL, 
  promocion_id integer NOT NULL,
  campus_id integer NOT NULL,
  modalidad_id integer NOT NULL
);