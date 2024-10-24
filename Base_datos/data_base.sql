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

--creando tablas

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
  vertical_name VARCHAR(45) NOT NULL
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
  FOREIGN KEY (docente_id) REFERENCES claustro(docente_id)  
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

INSERT INTO vertical (vertical_name) VALUES
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

INSERT INTO alumnos (nombre, apellido, email, campus_id, promocion_id, modalidad_id, vertical_id, lead_instructor_id, teaching_assistant_id) VALUES
('jafet', 'casals', 'jafet_casals@gmail.com', 1, 1, 1, 2, 4, 1),
('jorge', 'manzanares', 'jorge_manzanares@gmail.com', 1, 1, 1, 2, 4, 1),
('onofre', 'adadia', 'onofre_adadia@gmail.com', 1, 1, 1, 2, 4, 1),
('merche', 'prada', 'merche_prada@gmail.com', 1, 1, 1, 2, 4, 1),
('pilar', 'abella', 'pilar_abella@gmail.com', 1, 1, 1, 2, 4, 1),
('leoncio', 'tena', 'leoncio_tena@gmail.com', 1, 1, 1, 2, 4, 1),
('odalys', 'torrijos', 'odalys_torrijos@gmail.com', 1, 1, 1, 2, 4, 1),
('eduardo', 'caparros', 'eduardo_caparros@gmail.com', 1, 1, 1, 2, 4, 1),
('ignacio', 'goicoechea', 'ignacio_goicoechea@gmail.com', 1, 1, 1, 2, 4, 1),
('clementina', 'santos', 'clementina_santos@gmail.com', 1, 1, 1, 2, 4, 1),
('daniela', 'falco', 'daniela_falco@gmail.com', 1, 1, 1, 2, 4, 1),
('abraham', 'velez', 'abraham_velez@gmail.com', 1, 1, 1, 2, 4, 1),
('maximiliano', 'menendez', 'maximiliano_menendez@gmail.com', 1, 1, 1, 2, 4, 1),
('anita', 'heredia', 'anita_heredia@gmail.com', 1, 1, 1, 2, 4, 1),
('eli', 'casas', 'eli_casas@gmail.com', 1, 1, 1, 2, 4, 1),
('guillermo', 'borrego', 'guillermo_borrego@gmail.com', 1, 2, 1, 2, 5, 8),
('sergio', 'aguirre', 'sergio_aguirre@gmail.com', 1, 2, 1, 2, 5, 8),
('carlito', 'carrion', 'carlito_carrion@gmail.com', 1, 2, 1, 2, 5, 8),
('haydee', 'figueroa', 'haydee_figueroa@gmail.com', 1, 2, 1, 2, 5, 8),
('chita', 'mancebo', 'chita_mancebo@gmail.com', 1, 2, 1, 2, 5, 8),
('joaquina', 'asensio', 'joaquina_asensio@gmail.com', 1, 2, 1, 2, 5, 8),
('cristian', 'sarabia', 'cristian_sarabia@gmail.com', 1, 2, 1, 2, 5, 8),
('isabel', 'ibanez', 'isabel_ibanez@gmail.com', 1, 2, 1, 2, 5, 8),
('desiderio', 'jorda', 'desiderio_jorda@gmail.com', 1, 2, 1, 2, 5, 8),
('rosalina', 'llanos', 'rosalina_llanos@gmail.com', 1, 2, 1, 2, 5, 8),
('amor', 'larranaga', 'amor_larranaga@gmail.com', 1, 1, 1, 1, 2, 3),
('teodoro', 'alberola', 'teodoro_alberola@gmail.com', 1, 1, 1, 1, 2, 3),
('cleto', 'plana', 'cleto_plana@gmail.com', 1, 1, 1, 1, 2, 1),
('aitana', 'sebastian', 'aitana_sebastian@gmail.com', 1, 1, 1, 1, 2, 3),
('dolores', 'valbuena', 'dolores_valbuena@gmail.com', 1, 1, 1, 1, 2, 3),
('julie', 'ferrer', 'julie_ferrer@gmail.com', 1, 1, 1, 1, 2, 3),
('mireia', 'cabanas', 'mireia_cabanas@gmail.com', 1, 1, 1, 1, 2, 3),
('flavia', 'amador', 'flavia_amador@gmail.com', 1, 1, 1, 1, 2, 3),
('albino', 'macias', 'albino_macias@gmail.com', 1, 1, 1, 1, 2, 3),
('ester', 'sanchez', 'ester_sanchez@gmail.com', 1, 1, 1, 1, 2, 3),
('luis miguel', 'galvez', 'luis_miguel_galvez@gmail.com', 1, 1, 1, 1, 2, 3),
('loida', 'arellano', 'loida_arellano@gmail.com', 1, 1, 1, 1, 2, 3),
('heraclio', 'duque', 'heraclio_duque@gmail.com', 1, 1, 1, 1, 2, 3),
('herberto', 'figueras', 'herberto_figueras@gmail.com', 1, 1, 1, 1, 2, 3),
('teresa', 'laguna', 'teresa_laguna@gmail.com', 2, 2, 1, 1, 1, 5),
('estrella', 'murillo', 'estrella_murillo@gmail.com', 2, 2, 1, 1, 1, 5),
('ernesto', 'uriarte', 'ernesto_uriarte@gmail.com', 2, 2, 1, 1, 1, 5),
('daniela', 'guitart', 'daniela_guitart@gmail.com', 2, 2, 1, 1, 1, 5),
('timoteo', 'trillo', 'timoteo_trillo@gmail.com', 2, 2, 1, 1, 1, 5),
('ricarda', 'tovar', 'ricarda_tovar@gmail.com', 2, 2, 1, 1, 1, 5),
('alejandra', 'vilaplana', 'alejandra_vilaplana@gmail.com', 2, 2, 1, 1, 1, 5),
('daniel', 'rossello', 'daniel_rossello@gmail.com', 2, 2, 1, 1, 1, 5),
('rita', 'olivares', 'rita_olivares@gmail.com', 2, 2, 1, 1, 1, 5),
('cleto', 'montes', 'cleto_montes@gmail.com', 2, 2, 1, 1, 1, 5),
('marino', 'castilla', 'marino_castilla@gmail.com', 2, 2, 1, 1, 1, 5),
('estefania', 'valcarcel', 'estefania_valcarcel@gmail.com', 2, 2, 1, 1, 1, 5),
('noemi', 'vilanova', 'noemi_vilanova@gmail.com', 2, 2, 1, 1, 1, 5);

INSERT INTO claustro (nombre_docente, apellido_docente, vertical_id, promocion_id, campus_id, modalidad_id) VALUES 
('noa', 'yanez', 2, 1, 1, 1), 
('saturnina', 'benitez', 2, 1, 1, 1), 
('anna', 'feliu', 1, 1, 1, 1), 
('rosalva', 'ayuso', 1, 1, 2, 1), 
('ana sofia', 'ferrer', 1, 2, 2, 1), 
('angelica', 'corral', 1, 2, 1, 1), 
('ariel', 'lledo', 2, 1, 1, 1), 
('mario', 'prats', 1, 2, 2, 2), 
('luis angel', 'suarez', 1, 1, 1, 2), 
('maria dolores', 'diaz', 2, 1, 1, 2), 
('juan', 'gomez', 2, 1, 1, 1), 
('miguel', 'castro', 2, 2, 1, 1), 
('alfonso', 'ramirez', 2, 2, 1, 1);


INSERT INTO proyectos (proyecto_nombre, vertical_id, promocion_id) VALUES
('Proyecto_HLF', 2, 1),
('Proyecto_EDA', 2, 1),
('Proyecto_BBDD', 2, 1),
('Proyecto_ML', 2, 1),
('Proyecto_Deployment', 2, 1),
('Proyecto_HLF', 2, 2),
('Proyecto_EDA', 2, 2),
('Proyecto_BBDD', 2, 2),
('Proyecto_ML', 2, 2),
('Proyecto_Deployment', 2, 2),
('Proyecto_WebDev', 2, 1),
('Proyecto_FrontEnd', 2, 1),
('Proyecto_Backend', 2, 1),
('Proyecto_React', 2, 1),
('Proyecto_FullStack', 2, 1),
('Proyecto_WebDev', 2, 2),
('Proyecto_FrontEnd', 2, 2),
('Proyecto_Backend', 2, 2),
('Proyecto_React', 2, 2),
('Proyecto_FullStack', 2, 2);


INSERT INTO estudiante_proyectos (alumno_id, proyecto_id, calificacion) VALUES
(1, 1, 'Apto'), (1, 2, 'No Apto'), (1, 3, 'Apto'), (1, 4, 'Apto'), (1, 5, 'Apto'),
(2, 1, 'Apto'), (2, 2, 'No Apto'), (2, 3, 'Apto'), (2, 4, 'Apto'), (2, 5, 'Apto'),
(3, 1, 'Apto'), (3, 2, 'Apto'), (3, 3, 'Apto'), (3, 4, 'No Apto'), (3, 5, 'Apto'),
(4, 1, 'Apto'), (4, 2, 'No Apto'), (4, 3, 'No Apto'), (4, 4, 'Apto'), (4, 5, 'No Apto'),
(5, 1, 'Apto'), (5, 2, 'No Apto'), (5, 3, 'Apto'), (5, 4, 'Apto'), (5, 5, 'Apto'),
(6, 1, 'Apto'), (6, 2, 'Apto'), (6, 3, 'Apto'), (6, 4, 'Apto'), (6, 5, 'Apto'),
(7, 1, 'No Apto'), (7, 2, 'Apto'), (7, 3, 'Apto'), (7, 4, 'Apto'), (7, 5, 'Apto'),
(8, 1, 'No Apto'), (8, 2, 'Apto'), (8, 3, 'Apto'), (8, 4, 'Apto'), (8, 5, 'Apto'),
(9, 1, 'Apto'), (9, 2, 'Apto'), (9, 3, 'Apto'), (9, 4, 'No Apto'), (9, 5, 'Apto'),
(10, 1, 'Apto'), (10, 2, 'No Apto'), (10, 3, 'Apto'), (10, 4, 'Apto'), (10, 5, 'Apto'),
(11, 1, 'Apto'), (11, 2, 'Apto'), (11, 3, 'Apto'), (11, 4, 'Apto'), (11, 5, 'Apto'),
(12, 1, 'Apto'), (12, 2, 'No Apto'), (12, 3, 'No Apto'), (12, 4, 'Apto'), (12, 5, 'Apto'),
(13, 1, 'Apto'), (13, 2, 'No Apto'), (13, 3, 'Apto'), (13, 4, 'Apto'), (13, 5, 'Apto'),
(14, 1, 'Apto'), (14, 2, 'Apto'), (14, 3, 'Apto'), (14, 4, 'Apto'), (14, 5, 'Apto'),
(15, 1, 'Apto'), (15, 2, 'Apto'), (15, 3, 'Apto'), (15, 4, 'Apto'), (15, 5, 'Apto'),
(16, 1, 'Apto'), (16, 2, 'No Apto'), (16, 3, 'No Apto'), (16, 4, 'Apto'), (16, 5, 'No Apto'),
(17, 1, 'Apto'), (17, 2, 'No Apto'), (17, 3, 'Apto'), (17, 4, 'Apto'), (17, 5, 'No Apto'),
(18, 1, 'Apto'), (18, 2, 'No Apto'), (18, 3, 'Apto'), (18, 4, 'Apto'), (18, 5, 'Apto'),
(19, 1, 'Apto'), (19, 2, 'Apto'), (19, 3, 'Apto'), (19, 4, 'Apto'), (19, 5, 'Apto'),
(20, 1, 'No Apto'), (20, 2, 'Apto'), (20, 3, 'No Apto'), (20, 4, 'Apto'), (20, 5, 'Apto'),
(21, 1, 'No Apto'), (21, 2, 'No Apto'), (21, 3, 'Apto'), (21, 4, 'Apto'), (21, 5, 'Apto'),
(22, 1, 'Apto'), (22, 2, 'Apto'), (22, 3, 'No Apto'), (22, 4, 'Apto'), (22, 5, 'Apto'),
(23, 1, 'No Apto'), (23, 2, 'Apto'), (23, 3, 'No Apto'), (23, 4, 'Apto'), (23, 5, 'Apto'),
(24, 1, 'No Apto'), (24, 2, 'Apto'), (24, 3, 'No Apto'), (24, 4, 'No Apto'), (24, 5, 'Apto'),
(25, 1, 'Apto'), (25, 2, 'Apto'), (25, 3, 'Apto'), (25, 4, 'Apto'), (25, 5, 'Apto'),
(26, 1, 'Apto'), (26, 2, 'Apto'), (26, 3, 'Apto'), (26, 4, 'Apto'), (26, 5, 'No Apto'),
(27, 1, 'No Apto'), (27, 2, 'No Apto'), (27, 3, 'Apto'), (27, 4, 'No Apto'), (27, 5, 'Apto'),
(28, 1, 'Apto'), (28, 2, 'No Apto'), (28, 3, 'Apto'), (28, 4, 'No Apto'), (28, 5, 'Apto'),
(29, 1, 'Apto'), (29, 2, 'No Apto'), (29, 3, 'Apto'), (29, 4, 'No Apto'), (29, 5, 'Apto'),
(30, 1, 'Apto'), (30, 2, 'Apto'), (30, 3, 'Apto'), (30, 4, 'Apto'), (30, 5, 'No Apto'),
(31, 1, 'No Apto'), (31, 2, 'No Apto'), (31, 3, 'No Apto'), (31, 4, 'Apto'), (31, 5, 'No Apto'),
(32, 1, 'No Apto'), (32, 2, 'Apto'), (32, 3, 'Apto'), (32, 4, 'Apto'), (32, 5, 'Apto'),
(33, 1, 'Apto'), (33, 2, 'Apto'), (33, 3, 'No Apto'), (33, 4, 'Apto'), (33, 5, 'Apto'),
(34, 1, 'No Apto'), (34, 2, 'Apto'), (34, 3, 'Apto'), (34, 4, 'Apto'), (34, 5, 'Apto'),
(35, 1, 'No Apto'), (35, 2, 'Apto'), (35, 3, 'Apto'), (35, 4, 'No Apto'), (35, 5, 'Apto'),
(36, 1, 'No Apto'), (36, 2, 'Apto'), (36, 3, 'Apto'), (36, 4, 'Apto'), (36, 5, 'Apto'),
(37, 1, 'Apto'), (37, 2, 'Apto'), (37, 3, 'Apto'), (37, 4, 'Apto'), (37, 5, 'Apto'),
(38, 1, 'Apto'), (38, 2, 'Apto'), (38, 3, 'No Apto'), (38, 4, 'No Apto'), (38, 5, 'No Apto'),
(39, 1, 'Apto'), (39, 2, 'Apto'), (39, 3, 'Apto'), (39, 4, 'Apto'), (39, 5, 'Apto'),
(40, 1, 'Apto'), (40, 2, 'Apto'), (40, 3, 'Apto'), (40, 4, 'Apto'), (40, 5, 'Apto'),
(41, 1, 'Apto'), (41, 2, 'Apto'), (41, 3, 'No Apto'), (41, 4, 'Apto'), (41, 5, 'Apto'),
(42, 1, 'Apto'), (42, 2, 'Apto'), (42, 3, 'Apto'), (42, 4, 'Apto'), (42, 5, 'Apto'),
(43, 1, 'Apto'), (43, 2, 'No Apto'), (43, 3, 'No Apto'), (43, 4, 'Apto'), (43, 5, 'Apto'),
(44, 1, 'No Apto'), (44, 2, 'Apto'), (44, 3, 'Apto'), (44, 4, 'Apto'), (44, 5, 'No Apto'),
(45, 1, 'Apto'), (45, 2, 'Apto'), (45, 3, 'Apto'), (45, 4, 'Apto'), (45, 5, 'Apto'),
(46, 1, 'No Apto'), (46, 2, 'No Apto'), (46, 3, 'No Apto'), (46, 4, 'Apto'), (46, 5, 'Apto'),
(47, 1, 'No Apto'), (47, 2, 'No Apto'), (47, 3, 'Apto'), (47, 4, 'No Apto'), (47, 5, 'No Apto'),
(48, 1, 'No Apto'), (48, 2, 'No Apto'), (48, 3, 'No Apto'), (48, 4, 'Apto'), (48, 5, 'Apto'),
(49, 1, 'Apto'), (49, 2, 'Apto'), (49, 3, 'No Apto'), (49, 4, 'Apto'), (49, 5, 'Apto'),
(50, 1, 'No Apto'), (50, 2, 'No Apto'), (50, 3, 'Apto'), (50, 4, 'No Apto'), (50, 5, 'No Apto'),
(51, 1, 'Apto'), (51, 2, 'Apto'), (51, 3, 'No Apto'), (51, 4, 'No Apto'), (51, 5, 'Apto'),
(52, 1, 'Apto'), (52, 2, 'No Apto'), (52, 3, 'No Apto'), (52, 4, 'Apto'), (52, 5, 'Apto');