-- Insertar datos en la tabla campus
INSERT INTO campus (campus_nombre) VALUES ('Valencia');

-- Insertar datos en la tabla promocion
INSERT INTO promocion (nombre) VALUES ('Febrero');

-- Insertar datos en la tabla vertical (si es necesario) - asumimos que los proyectos ya existen
INSERT INTO vertical (vertical_name) VALUES ('Web Development'), ('Frontend'), ('Backend'), ('React'), ('FullStack');


-- Insertar nuevos alumnos
INSERT INTO alumno (nombre, apellido, email, id_campus, id_promocion) VALUES
('Teresa', 'Laguna', 'Teresa_Laguna@gmail.com', 2, 2),
('Estrella', 'Murillo', 'Estrella_Murillo@gmail.com', 2, 2),
('Ernesto', 'Uriarte', 'Ernesto_Uriarte@gmail.com', 2, 2),
('Daniela', 'Guitart', 'Daniela_Guitart@gmail.com', 2, 2),
('Timoteo', 'Trillo', 'Timoteo_Trillo@gmail.com', 2, 2),
('Ricarda', 'Tovar', 'Ricarda_Tovar@gmail.com', 2, 2),
('Alejandra', 'Vilaplana', 'Alejandra_Vilaplana@gmail.com', 2, 2),
('Daniel', 'Rosselló', 'Daniel_Rosselló@gmail.com', 2, 2),
('Rita', 'Olivares', 'Rita_Olivares@gmail.com', 2, 2),
('Cleto', 'Montes', 'Cleto_Montes@gmail.com', 2, 2),
('Marino', 'Castilla', 'Marino_Castilla@gmail.com', 2, 2),
('Estefanía', 'Valcárcel', 'Estefanía_Valcárcel@gmail.com', 2, 2),
('Noemí', 'Vilanova', 'Noemí_Vilanova@gmail.com', 2, 2);


-- Insertar calificaciones
INSERT INTO calificacion (id_alumno, id_proyecto, fecha_inicio, fecha_entrega, estado) VALUES
(1, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Teresa Laguna
(1, 2, '2024-02-12', '2024-02-29', 'Apto'),
(1, 3, '2024-02-12', '2024-02-29', 'Apto'),
(1, 4, '2024-02-12', '2024-02-29', 'Apto'),
(1, 5, '2024-02-12', '2024-02-29', 'Apto'),

(2, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Estrella Murillo
(2, 2, '2024-02-12', '2024-02-29', 'Apto'),
(2, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(2, 4, '2024-02-12', '2024-02-29', 'Apto'),
(2, 5, '2024-02-12', '2024-02-29', 'Apto'),

(3, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Ernesto Uriarte
(3, 2, '2024-02-12', '2024-02-29', 'Apto'),
(3, 3, '2024-02-12', '2024-02-29', 'Apto'),
(3, 4, '2024-02-12', '2024-02-29', 'Apto'),
(3, 5, '2024-02-12', '2024-02-29', 'Apto'),

(4, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Daniela Guitart
(4, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(4, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(4, 4, '2024-02-12', '2024-02-29', 'Apto'),
(4, 5, '2024-02-12', '2024-02-29', 'Apto'),

(5, 1, '2024-02-12', '2024-02-29', 'No Apto'), -- Timoteo Trillo
(5, 2, '2024-02-12', '2024-02-29', 'Apto'),
(5, 3, '2024-02-12', '2024-02-29', 'Apto'),
(5, 4, '2024-02-12', '2024-02-29', 'Apto'),
(5, 5, '2024-02-12', '2024-02-29', 'No Apto'),

(6, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Ricarda Tovar
(6, 2, '2024-02-12', '2024-02-29', 'Apto'),
(6, 3, '2024-02-12', '2024-02-29', 'Apto'),
(6, 4, '2024-02-12', '2024-02-29', 'Apto'),
(6, 5, '2024-02-12', '2024-02-29', 'Apto'),

(7, 1, '2024-02-12', '2024-02-29', 'No Apto'), -- Alejandra Vilaplana
(7, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(7, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(7, 4, '2024-02-12', '2024-02-29', 'Apto'),
(7, 5, '2024-02-12', '2024-02-29', 'Apto'),

(8, 1, '2024-02-12', '2024-02-29', 'No Apto'), -- Daniel Rosselló
(8, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(8, 3, '2024-02-12', '2024-02-29', 'Apto'),
(8, 4, '2024-02-12', '2024-02-29', 'No Apto'),
(8, 5, '2024-02-12', '2024-02-29', 'No Apto'),

(9, 1, '2024-02-12', '2024-02-29', 'No Apto'), -- Rita Olivares
(9, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(9, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(9, 4, '2024-02-12', '2024-02-29', 'Apto'),
(9, 5, '2024-02-12', '2024-02-29', 'Apto'),

(10, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Cleto Montes
(10, 2, '2024-02-12', '2024-02-29', 'Apto'),
(10, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(10, 4, '2024-02-12', '2024-02-29', 'Apto'),
(10, 5, '2024-02-12', '2024-02-29', 'Apto'),

(11, 1, '2024-02-12', '2024-02-29', 'No Apto'), -- Marino Castilla
(11, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(11, 3, '2024-02-12', '2024-02-29', 'Apto'),
(11, 4, '2024-02-12', '2024-02-29', 'No Apto'),
(11, 5, '2024-02-12', '2024-02-29', 'No Apto'),

(12, 1, '2024-02-12', '2024-02-29', 'Apto'),   -- Estefanía Valcárcel
(12, 2, '2024-02-12', '2024-02-29', 'Apto'),
(12, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(12, 4, '2024-02-12', '2024-02-29', 'No Apto'),
(12, 5, '2024-02-12', '2024-02-29', 'Apto'),

(13, 1, '2024-02-12', '2024-02-29', 'Apto');   -- Noemí Vilanova
(13, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(13, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(13, 4, '2024-02-12', '2024-02-29', 'Apto'),
(13, 5, '2024-02-12', '2024-02-29', 'Apto');
