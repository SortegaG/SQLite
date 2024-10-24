-- Eliminar tablas en el orden correcto
DROP TABLE IF EXISTS estudiante_proyectos CASCADE;
DROP TABLE IF EXISTS claustro CASCADE;
DROP TABLE IF EXISTS proyectos CASCADE;
DROP TABLE IF EXISTS alumnos CASCADE;
DROP TABLE IF EXISTS modalidad CASCADE;
DROP TABLE IF EXISTS vertical CASCADE;
DROP TABLE IF EXISTS promocion CASCADE;
DROP TABLE IF EXISTS campus CASCADE;
DROP TABLE IF EXISTS lead_instructor CASCADE;
DROP TABLE IF EXISTS teaching_assistant CASCADE;

CREATE TABLE campus (
  campus_id SERIAL NOT NULL PRIMARY KEY, 
  campus_nombre VARCHAR(45) NOT NULL
);

CREATE TABLE promocion (
  promocion_id SERIAL NOT NULL PRIMARY KEY,
  promocion_nombre VARCHAR(45) NOT NULL,
  fecha_comienzo DATE NOT NULL
);

CREATE TABLE vertical (
  vertical_id SERIAL NOT NULL PRIMARY KEY, 
  vertical_nombre VARCHAR(45) NOT NULL
);

CREATE TABLE modalidad (
  modalidad_id SERIAL NOT NULL PRIMARY KEY, 
  tipo_modalidad VARCHAR(45) NOT NULL
);


CREATE TABLE claustro (
  docente_id SERIAL NOT NULL PRIMARY KEY, 
  nombre_docente VARCHAR(45) NOT NULL,
  apellido_docente VARCHAR(45) NOT NULL,
  vertical_id INTEGER NOT NULL, 
  promocion_id INTEGER NOT NULL,
  campus_id INTEGER NOT NULL,
  modalidad_id INTEGER NOT NULL,
  FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id)
);


CREATE TABLE lead_instructor (
  lead_instructor_id SERIAL NOT NULL PRIMARY KEY, 
  docente_id INTEGER NOT NULL,
  FOREIGN KEY (docente_id) REFERENCES claustro(docente_id)
);

CREATE TABLE teaching_assistant (
  teaching_assistant_id SERIAL NOT NULL PRIMARY KEY, 
  docente_id INTEGER NOT NULL,
  FOREIGN KEY (docente_id) REFERENCES claustro(docente_id)  -- Renamed constraint here
);

CREATE TABLE alumnos (
  alumno_id SERIAL NOT NULL PRIMARY KEY, 
  nombre VARCHAR(45) NOT NULL, 
  apellido VARCHAR(45) NOT NULL, 
  email VARCHAR(100) NOT NULL UNIQUE,
  campus_id INTEGER NOT NULL,
  promocion_id INTEGER NOT NULL,
  modalidad_id INTEGER NOT NULL,
  vertical_id INTEGER NOT NULL,
  lead_instructor_id INTEGER NOT NULL,
  teaching_assistant_id INTEGER NOT NULL,
  FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id),
  FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  FOREIGN KEY (lead_instructor_id) REFERENCES lead_instructor(lead_instructor_id),
  FOREIGN KEY (teaching_assistant_id) REFERENCES teaching_assistant(teaching_assistant_id)
);

CREATE TABLE proyectos (
  proyecto_id SERIAL NOT NULL PRIMARY KEY, 
  proyecto_nombre VARCHAR(45) NOT NULL, 
  vertical_id INTEGER NOT NULL,
  promocion_id INTEGER NOT NULL,
  FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id)
);

CREATE TABLE estudiante_proyectos ( 
  alumno_id INTEGER NOT NULL,
  proyecto_id INTEGER NOT NULL, 
  calificacion VARCHAR (45) NOT NULL, 
  PRIMARY KEY (alumno_id, proyecto_id),
  FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id),
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

--populando tablas 

INSERT INTO campus (campus_nombre) VALUES
('madrid'),
('valencia');

INSERT INTO promocion (promocion_nombre, fecha_comienzo) VALUES
('septiembre', '2023-09-18'),
('febrero', '2024-02-12');

INSERT INTO vertical (vertical_nombre) VALUES
('fullstack_developer'),
('data_science');

INSERT INTO modalidad (tipo_modalidad) VALUES
('presencial'),
('online');

INSERT INTO claustro (nombre_docente, apellido_docente, vertical_id, promocion_id, campus_id, modalidad_id) VALUES
('noa', 'yanez', 2, 1, 1, 1),  -- ta, ds, septiembre, madrid, presencial
('saturnina', 'benitez', 2, 1, 1, 1),  -- ta, ds, septiembre, madrid, presencial
('anna', 'feliu', 1, 1, 1, 1),  -- ta, fs, septiembre, madrid, presencial
('rosalva', 'ayuso', 1, 1, 2, 1),  -- ta, fs, septiembre, valencia, presencial
('ana sofía', 'ferrer', 1, 2, 2, 1),  -- ta, fs, febrero, valencia, presencial
('angelica', 'corral', 1, 2, 1, 1),  -- TA, FS, Febrero, Madrid, Presencial
('ariel', 'lledo', 2, 1, 1, 1),  -- TA, DS, Septiembre, Madrid, Presencial
('mario', 'prats', 1, 2, 2, 2),  -- LI, FS, Febrero, Valencia, Online
('luis angel', 'suarez', 1, 1, 1, 2),  -- LI, FS, Septiembre, Madrid, Online
('maria dolores', 'diaz', 2, 1, 1, 2),  -- LI, DS, Septiembre, Madrid, Online
('juan', 'gomez', 2, 1, 1, 1), -- LI, DS, Septiembre, Madrid, presencial
('miguel', 'castro', 2, 2, 1, 1), -- LI, DS, febrero, Madrid, presencial
('alfonso', 'ramirez', 2, 2, 1, 1); -- ta, DS, febrero, Madrid, presencial

INSERT INTO teaching_assistant (docente_id) VALUES
(1),  -- noa yanez
(2),  -- saturnina benitez
(3),  -- anna feliu
(4),  -- rosalva ayuso
(5),  -- ana sofía ferrer
(6),  -- angelica corral
(7),  -- ariel lledo
(8); -- alfonso ramirez

INSERT INTO lead_instructor (docente_id) VALUES
(8),  -- mario prats
(9),  -- luis angel suarez
(10), -- maría dolores diaz
(11), -- juan gomez
(12); -- miguel castro