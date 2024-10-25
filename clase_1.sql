-- Asumiendo que ya existen los siguientes registros:
INSERT INTO campus (campus_nombre) VALUES ('Madrid');
INSERT INTO promocion (promocion_nombre, fecha_comienzo) VALUES ('Septiembre', '2023-09-18');

-- Asumiendo valores ficticios para vertical_id, modalidad_id, lead_instructor_id y teaching_assistant_id
INSERT INTO alumnos (nombre, apellido, email, campus_id, promocion_id, modalidad_id, vertical_id, lead_instructor_id, teaching_assistant_id) VALUES
('Jafet', 'Casals', 'Jafet_Casals@gmail.com', 1, 1, 1, 1, 1, 1),
('Jorge', 'Manzanares', 'Jorge_Manzanares@gmail.com', 1, 1, 1, 1, 1, 1),
('Onofre', 'Adadia', 'Onofre_Adadia@gmail.com', 1, 1, 1, 1, 1, 1),
('Merche', 'Prada', 'Merche_Prada@gmail.com', 1, 1, 1, 1, 1, 1),
('Pilar', 'Abella', 'Pilar_Abella@gmail.com', 1, 1, 1, 1, 1, 1),
('Leoncio', 'Tena', 'Leoncio_Tena@gmail.com', 1, 1, 1, 1, 1, 1),
('Odalys', 'Torrijos', 'Odalys_Torrijos@gmail.com', 1, 1, 1, 1, 1, 1),
('Eduardo', 'Caparrós', 'Eduardo_Caparrós@gmail.com', 1, 1, 1, 1, 1, 1),
('Ignacio', 'Goicoechea', 'Ignacio_Goicoechea@gmail.com', 1, 1, 1, 1, 1, 1),
('Clementina', 'Santos', 'Clementina_Santos@gmail.com', 1, 1, 1, 1, 1, 1),
('Daniela', 'Falcó', 'Daniela_Falcó@gmail.com', 1, 1, 1, 1, 1, 1),
('Abraham', 'Vélez', 'Abraham_Vélez@gmail.com', 1, 1, 1, 1, 1, 1),
('Maximiliano', 'Menéndez', 'Maximiliano_Menéndez@gmail.com', 1, 1, 1, 1, 1, 1),
('Anita', 'Heredia', 'Anita_Heredia@gmail.com', 1, 1, 1, 1, 1, 1),
('Eli', 'Casas', 'Eli_Casas@gmail.com', 1, 1, 1, 1, 1, 1);

-- Insertar Proyectos
INSERT INTO proyectos (proyecto_nombre, vertical_id, calificacion, promocion_id) VALUES
('Proyecto_HLF', 1, 'Apto', 1),
('Proyecto_EDA', 1, 'Apto', 1),
('Proyecto_BBDD', 1, 'Apto', 1),
('Proyecto_ML', 1, 'Apto', 1),
('Proyecto_Deployment', 1, 'Apto', 1);

INSERT INTO estudiante_proyectos (alumno_id, proyecto_id, calificacion) VALUES
(1, 1, 'Apto'),    -- Jafet Casals -> Proyecto_HLF
(1, 2, 'No Apto'), -- Jafet Casals -> Proyecto_EDA
(1, 3, 'Apto'),    -- Jafet Casals -> Proyecto_BBDD
(1, 4, 'Apto'),    -- Jafet Casals -> Proyecto_ML
(1, 5, 'Apto'),    -- Jafet Casals -> Proyecto_Deployment
(2, 1, 'Apto'),    -- Jorge Manzanares
(2, 2, 'No Apto'),
(2, 3, 'Apto'),
(2, 4, 'Apto'),
(2, 5, 'Apto'),
(3, 1, 'Apto'),    -- Onofre Adadia
(3, 2, 'Apto'),
(3, 3, 'Apto'),
(3, 4, 'No Apto'),
(3, 5, 'Apto'),
(4, 1, 'Apto'),    -- Merche Prada
(4, 2, 'No Apto'),
(4, 3, 'No Apto'),
(4, 4, 'Apto'),
(4, 5, 'No Apto'),
(5, 1, 'Apto'),    -- Pilar Abella
(5, 2, 'No Apto'),
(5, 3, 'Apto'),
(5, 4, 'Apto'),
(5, 5, 'Apto'),
(6, 1, 'Apto'),    -- Leoncio Tena
(6, 2, 'Apto'),
(6, 3, 'Apto'),
(6, 4, 'Apto'),
(6, 5, 'Apto'),
(7, 1, 'No Apto'), -- Odalys Torrijos
(7, 2, 'Apto'),
(7, 3, 'Apto'),
(7, 4, 'Apto'),
(7, 5, 'Apto'),
(8, 1, 'No Apto'), -- Eduardo Caparrós
(8, 2, 'Apto'),
(8, 3, 'Apto'),
(8, 4, 'Apto'),
(8, 5, 'Apto'),
(9, 1, 'Apto'),    -- Ignacio Goicoechea
(9, 2, 'Apto'),
(9, 3, 'Apto'),
(9, 4, 'No Apto'),
(9, 5, 'Apto'),
(10, 1, 'Apto'),   -- Clementina Santos
(10, 2, 'No Apto'),
(10, 3, 'Apto'),
(10, 4, 'Apto'),
(10, 5, 'Apto'),
(11, 1, 'Apto'),   -- Daniela Falcó
(11, 2, 'Apto'),
(11, 3, 'Apto'),
(11, 4, 'Apto'),
(11, 5, 'Apto'),
(12, 1, 'No Apto'), -- Abraham Vélez
(12, 2, 'No Apto'),
(12, 3, 'Apto'),
(12, 4, 'Apto'),
(12, 5, 'Apto'),
(13, 1, 'Apto'),   -- Maximiliano Menéndez
(13, 2, 'No Apto'),
(13, 3, 'Apto'),
(13, 4, 'Apto'),
(13, 5, 'Apto'),
(14, 1, 'Apto'),   -- Anita Heredia
(14, 2, 'Apto'),
(14, 3, 'Apto'),
(14, 4, 'Apto'),
(14, 5, 'Apto'),
(15, 1, 'Apto');   -- Eli Casas
(15, 2, 'Apto'),
(15, 3, 'Apto'),
(15, 4, 'Apto'),
(15, 5, 'Apto');
