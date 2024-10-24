-- Eliminar tablas en el orden correcto
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
  promocion_nombre VARCHAR(45) NOT NULL,
  fecha_comienzo date NOT NULL
);

CREATE TABLE vertical (
  vertical_id SERIAL NOT NULL PRIMARY KEY, 
  vertical_name VARCHAR(45) NOT NULL
);

CREATE TABLE modalidad (
  modalidad_id SERIAL NOT NULL PRIMARY KEY, 
  tipo_modalidad VARCHAR(45) NOT NULL
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
  lead_instructor_id INTEGER NOT NULL,
  teaching_assistant_id INTEGER NOT NULL,
  CONSTRAINT fk_campus_alumnos FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_promocion_alumnos FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_modalidad_alumnos FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id),
  CONSTRAINT fk_vertical_alumnos FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_lead_instructor_alumnos FOREIGN KEY (lead_instructor_id) REFERENCES lead_instructor(lead_instructor_id),
  CONSTRAINT fk_teaching_assistant_alumnos FOREIGN KEY (teaching_assistant_id) REFERENCES teaching_assistant(teaching_assistant_id)
);

-- Create the proyectos table with the added columns
CREATE TABLE proyectos (
  proyecto_id SERIAL NOT NULL PRIMARY KEY, 
  proyecto_nombre VARCHAR(45) NOT NULL, 
  vertical_id INTEGER NOT NULL,
  alumno_id INTEGER NOT NULL,
  calificacion VARCHAR(45) NOT NULL,
  promocion_id INTEGER NOT NULL,
  CONSTRAINT fk_vertical_proyectos FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_alumno_proyectos FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),
  CONSTRAINT fk_promocion_proyectos FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id)
);

CREATE TABLE claustro (
  docente_id SERIAL NOT NULL PRIMARY KEY, 
  nombre_docente VARCHAR(45) NOT NULL,
  apellido_docente VARCHAR(45) NOT NULL,
  vertical_id INTEGER NOT NULL, 
  promocion_id INTEGER NOT NULL,
  campus_id INTEGER NOT NULL,
  modalidad_id INTEGER NOT NULL,
  CONSTRAINT fk_vertical_claustro FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  CONSTRAINT fk_promocion_claustro FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  CONSTRAINT fk_campus_claustro FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  CONSTRAINT fk_modalidad_claustro FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id)
);

CREATE TABLE lead_instructor (
  lead_instructor_id SERIAL NOT NULL PRIMARY KEY, 
  docente_id INTEGER NOT NULL,
  CONSTRAINT fk_docente_lead_instructor FOREIGN KEY (docente_id) REFERENCES claustro(docente_id)
);

CREATE TABLE teaching_assistant (
  teaching_assistant_id SERIAL NOT NULL PRIMARY KEY, 
  docente_id INTEGER NOT NULL,
  CONSTRAINT fk_docente_lead_instructor FOREIGN KEY (docente_id) REFERENCES claustro(docente_id)
);

--populando tablas 


INSERT INTO campus (campus_nombre) VALUES
('Madrid'),
('Valencia');

INSERT INTO promocion (promocion_nombre, fecha_comienzo) VALUES
('Septiembre', '2023-09-18'),
('Febrero', '2024-02-12');

INSERT INTO vertical (vertical_name) VALUES
('Fullstack Developer'),
('Data Science');

INSERT INTO modalidad (tipo_modalidad) VALUES
('Presencial'),
('Online');

INSERT INTO claustro (nombre_docente, apellido_docente, vertical_id, promocion_id, campus_id, modalidad_id) VALUES
('Noa', 'Yáñez', 2, 1, 1, 1),  -- TA, DS, Septiembre, Madrid, Presencial
('Saturnina', 'Benitez', 2, 1, 1, 1),  -- TA, DS, Septiembre, Madrid, Presencial
('Anna', 'Feliu', 1, 1, 1, 1),  -- TA, FS, Septiembre, Madrid, Presencial
('Rosalva', 'Ayuso', 1, 1, 2, 1),  -- TA, FS, Septiembre, Valencia, Presencial
('Ana Sofía', 'Ferrer', 1, 2, 2, 1),  -- TA, FS, Febrero, Valencia, Presencial
('Angélica', 'Corral', 1, 2, 1, 1),  -- TA, FS, Febrero, Madrid, Presencial
('Ariel', 'Lledó', 2, 1, 1, 1),  -- TA, DS, Septiembre, Madrid, Presencial
('Mario', 'Prats', 1, 2, 2, 2),  -- LI, FS, Febrero, Valencia, Online
('Luis Ángel', 'Suárez', 1, 1, 1, 2),  -- LI, FS, Septiembre, Madrid, Online
('María Dolores', 'Diaz', 2, 1, 1, 2);  -- LI, DS, Septiembre, Madrid, Online

INSERT INTO teaching_assistant (docente_id) VALUES
(1),  -- Noa Yáñez
(2),  -- Saturnina Benitez
(3),  -- Anna Feliu
(4),  -- Rosalva Ayuso
(5),  -- Ana Sofía Ferrer
(6),  -- Angélica Corral
(7);  -- Ariel Lledó

INSERT INTO lead_instructor (docente_id) VALUES
(8),  -- Mario Prats
(9),  -- Luis Ángel Suárez
(10); -- María Dolores Diaz