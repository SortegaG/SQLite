-- Eliminar tablas en el orden correcto
DROP TABLE IF EXISTS calificacion CASCADE;
DROP TABLE IF EXISTS claustro CASCADE;
DROP TABLE IF EXISTS proyectos CASCADE;
DROP TABLE IF EXISTS alumnos CASCADE;
DROP TABLE IF EXISTS modalidad CASCADE;
DROP TABLE IF EXISTS vertical CASCADE;
DROP TABLE IF EXISTS promocion CASCADE;
DROP TABLE IF EXISTS campus CASCADE;

CREATE TABLE campus (
  campus_id SERIAL NOT NULL PRIMARY KEY, 
  campus_nombre VARCHAR(45) NOT NULL
);

CREATE TABLE promocion (
  promocion_id SERIAL NOT NULL PRIMARY KEY,
  promocion_nombre VARCHAR(45) NOT NULL
);

CREATE TABLE vertical (
  vertical_id SERIAL NOT NULL PRIMARY KEY, 
  vertical_name VARCHAR(45) NOT NULL
);

CREATE TABLE modalidad (
  modalidad_id SERIAL NOT NULL PRIMARY KEY, 
  mes VARCHAR(45) NOT NULL, 
  fecha DATE NOT NULL
);

CREATE TABLE alumnos (
  id_alumno SERIAL NOT NULL PRIMARY KEY, 
  nombre VARCHAR(45) NOT NULL, 
  apellido VARCHAR(45) NOT NULL, 
  email VARCHAR(100) NOT NULL UNIQUE,
  campus_id INTEGER NOT NULL,
  promocion_id INTEGER NOT NULL,
  modalidad_id INTEGER NOT NULL,
  vertical_id INTEGER NOT NULL,
  CONSTRAINT fk_campus FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_promocion FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_modalidad FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id),
  CONSTRAINT fk_vertical FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id)
);

-- Drop the proyectos table if it exists
DROP TABLE IF EXISTS proyectos;

-- Create the proyectos table with the added columns
CREATE TABLE proyectos (
  proyecto_id SERIAL NOT NULL PRIMARY KEY, 
  proyecto_nombre VARCHAR(45) NOT NULL, 
  vertical_id INTEGER NOT NULL,
  alumno_id INTEGER NOT NULL,
  calificacion VARCHAR(45) NOT NULL,
  fecha_inicio DATE NOT NULL,            -- New column
  fecha_entrega DATE NOT NULL,           -- New column
  estado VARCHAR(20) DEFAULT 'en progreso',  -- New column with default value
  CONSTRAINT fk_vertical_proyectos FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_alumno_id FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno)
);

CREATE TABLE claustro (
  claustro_id SERIAL NOT NULL PRIMARY KEY, 
  claustro_name VARCHAR(45) NOT NULL, 
  vertical_id INTEGER NOT NULL, 
  promocion_id INTEGER NOT NULL,
  campus_id INTEGER NOT NULL,
  modalidad_id INTEGER NOT NULL,
  CONSTRAINT fk_vertical_claustro FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_promocion_claustro FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_campus_claustro FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_modalidad_claustro FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id)
);
