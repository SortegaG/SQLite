-- Insertar datos en la tabla alumno
INSERT INTO alumno (nombre, apellido, email, id_campus, id_promocion) VALUES
('Guillermo', 'Borrego', 'Guillermo_Borrego@gmail.com', 1, 2),
('Sergio', 'Aguirre', 'Sergio_Aguirre@gmail.com', 1, 2),
('Carlito', 'Carrión', 'Carlito_Carrión@gmail.com', 1, 2),
('Haydée', 'Figueroa', 'Haydée_Figueroa@gmail.com', 1, 2),
('Chita', 'Mancebo', 'Chita_Mancebo@gmail.com', 1, 2),
('Joaquina', 'Asensio', 'Joaquina_Asensio@gmail.com', 1, 2),
('Cristian', 'Sarabia', 'Cristian_Sarabia@gmail.com', 1, 2),
('Isabel', 'Ibáñez', 'Isabel_Ibáñez@gmail.com', 1, 2),
('Desiderio', 'Jordá', 'Desiderio_Jordá@gmail.com', 1, 2),
('Rosalina', 'Llanos', 'Rosalina_Llanos@gmail.com', 1, 2);


-- Insertar datos en la tabla calificacion
INSERT INTO calificacion (id_alumno, id_proyecto, fecha_inicio, fecha_entrega, estado) VALUES
(1, 1, '2024-02-12', '2024-02-29', 'Apto'),  -- Guillermo Borrego
(1, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(1, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(1, 4, '2024-02-12', '2024-02-29', 'Apto'),
(1, 5, '2024-02-12', '2024-02-29', 'No Apto'),

(2, 1, '2024-02-12', '2024-02-29', 'Apto'),  -- Sergio Aguirre
(2, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(2, 3, '2024-02-12', '2024-02-29', 'Apto'),
(2, 4, '2024-02-12', '2024-02-29', 'Apto'),
(2, 5, '2024-02-12', '2024-02-29', 'No Apto'),

(3, 1, '2024-02-12', '2024-02-29', 'Apto'),  -- Carlito Carrión
(3, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(3, 3, '2024-02-12', '2024-02-29', 'Apto'),
(3, 4, '2024-02-12', '2024-02-29', 'Apto'),
(3, 5, '2024-02-12', '2024-02-29', 'Apto'),

(4, 1, '2024-02-12', '2024-02-29', 'Apto'),  -- Haydée Figueroa
(4, 2, '2024-02-12', '2024-02-29', 'Apto'),
(4, 3, '2024-02-12', '2024-02-29', 'Apto'),
(4, 4, '2024-02-12', '2024-02-29', 'Apto'),
(4, 5, '2024-02-12', '2024-02-29', 'Apto'),

(5, 1, '2024-02-12', '2024-02-29', 'No Apto'),  -- Chita Mancebo
(5, 2, '2024-02-12', '2024-02-29', 'Apto'),
(5, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(5, 4, '2024-02-12', '2024-02-29', 'Apto'),
(5, 5, '2024-02-12', '2024-02-29', 'Apto'),

(6, 1, '2024-02-12', '2024-02-29', 'No Apto'),  -- Joaquina Asensio
(6, 2, '2024-02-12', '2024-02-29', 'No Apto'),
(6, 3, '2024-02-12', '2024-02-29', 'Apto'),
(6, 4, '2024-02-12', '2024-02-29', 'Apto'),
(6, 5, '2024-02-12', '2024-02-29', 'Apto'),

(7, 1, '2024-02-12', '2024-02-29', 'Apto'),  -- Cristian Sarabia
(7, 2, '2024-02-12', '2024-02-29', 'Apto'),
(7, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(7, 4, '2024-02-12', '2024-02-29', 'Apto'),
(7, 5, '2024-02-12', '2024-02-29', 'Apto'),

(8, 1, '2024-02-12', '2024-02-29', 'No Apto'),  -- Isabel Ibáñez
(8, 2, '2024-02-12', '2024-02-29', 'Apto'),
(8, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(8, 4, '2024-02-12', '2024-02-29', 'Apto'),
(8, 5, '2024-02-12', '2024-02-29', 'Apto'),

(9, 1, '2024-02-12', '2024-02-29', 'No Apto'),  -- Desiderio Jordá
(9, 2, '2024-02-12', '2024-02-29', 'Apto'),
(9, 3, '2024-02-12', '2024-02-29', 'No Apto'),
(9, 4, '2024-02-12', '2024-02-29', 'No Apto'),
(9, 5, '2024-02-12', '2024-02-29', 'Apto'),

(10, 1, '2024-02-12', '2024-02-29', 'Apto');  -- Rosalina Llanos
(10, 2, '2024-02-12', '2024-02-29', 'Apto'),
(10, 3, '2024-02-12', '2024-02-29', 'Apto'),
(10, 4, '2024-02-12', '2024-02-29', 'Apto'),
(10, 5, '2024-02-12', '2024-02-29', 'Apto');
