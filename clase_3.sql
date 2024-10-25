-- Insertar datos en la tabla campus
INSERT INTO campus (campus_nombre) VALUES ('Madrid');

-- Insertar datos en la tabla promocion
INSERT INTO promocion (nombre) VALUES ('Septiembre');

-- Insertar datos en la tabla vertical (si es necesario)
INSERT INTO vertical (vertical_name) VALUES ('Web Development'), ('Frontend'), ('Backend'), ('React'), ('FullStack');


-- Insertar alumnos
INSERT INTO alumno (nombre, apellido, email, id_campus, id_promocion) VALUES
('Amor', 'Larrañaga', 'Amor_Larrañaga@gmail.com', 1, 1),
('Teodoro', 'Alberola', 'Teodoro_Alberola@gmail.com', 1, 1),
('Cleto', 'Plana', 'Cleto_Plana@gmail.com', 1, 1),
('Aitana', 'Sebastián', 'Aitana_Sebastián@gmail.com', 1, 1),
('Dolores', 'Valbuena', 'Dolores_Valbuena@gmail.com', 1, 1),
('Julie', 'Ferrer', 'Julie_Ferrer@gmail.com', 1, 1),
('Mireia', 'Cabañas', 'Mireia_Cabañas@gmail.com', 1, 1),
('Flavia', 'Amador', 'Flavia_Amador@gmail.com', 1, 1),
('Albino', 'Macias', 'Albino_Macias@gmail.com', 1, 1),
('Ester', 'Sánchez', 'Ester_Sánchez@gmail.com', 1, 1),
('Luis Miguel', 'Galvez', 'Luis_Miguel_Galvez@gmail.com', 1, 1),
('Loida', 'Arellano', 'Loida_Arellano@gmail.com', 1, 1),
('Heraclio', 'Duque', 'Heraclio_Duque@gmail.com', 1, 1),
('Herberto', 'Figueras', 'Herberto_Figueras@gmail.com', 1, 1);


-- Insertar calificaciones
INSERT INTO calificacion (id_alumno, id_proyecto, fecha_inicio, fecha_entrega, estado) VALUES
(1, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Amor Larrañaga
(1, 2, '2023-09-18', '2023-09-30', 'Apto'),
(1, 3, '2023-09-18', '2023-09-30', 'Apto'),
(1, 4, '2023-09-18', '2023-09-30', 'Apto'),
(1, 5, '2023-09-18', '2023-09-30', 'No Apto'),

(2, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Teodoro Alberola
(2, 2, '2023-09-18', '2023-09-30', 'No Apto'),
(2, 3, '2023-09-18', '2023-09-30', 'Apto'),
(2, 4, '2023-09-18', '2023-09-30', 'No Apto'),
(2, 5, '2023-09-18', '2023-09-30', 'Apto'),

(3, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Cleto Plana
(3, 2, '2023-09-18', '2023-09-30', 'No Apto'),
(3, 3, '2023-09-18', '2023-09-30', 'Apto'),
(3, 4, '2023-09-18', '2023-09-30', 'No Apto'),
(3, 5, '2023-09-18', '2023-09-30', 'Apto'),

(4, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Aitana Sebastián
(4, 2, '2023-09-18', '2023-09-30', 'No Apto'),
(4, 3, '2023-09-18', '2023-09-30', 'Apto'),
(4, 4, '2023-09-18', '2023-09-30', 'No Apto'),
(4, 5, '2023-09-18', '2023-09-30', 'Apto'),

(5, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Dolores Valbuena
(5, 2, '2023-09-18', '2023-09-30', 'Apto'),
(5, 3, '2023-09-18', '2023-09-30', 'Apto'),
(5, 4, '2023-09-18', '2023-09-30', 'Apto'),
(5, 5, '2023-09-18', '2023-09-30', 'No Apto'),

(6, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Julie Ferrer
(6, 2, '2023-09-18', '2023-09-30', 'No Apto'),
(6, 3, '2023-09-18', '2023-09-30', 'No Apto'),
(6, 4, '2023-09-18', '2023-09-30', 'Apto'),
(6, 5, '2023-09-18', '2023-09-30', 'No Apto'),

(7, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Mireia Cabañas
(7, 2, '2023-09-18', '2023-09-30', 'Apto'),
(7, 3, '2023-09-18', '2023-09-30', 'Apto'),
(7, 4, '2023-09-18', '2023-09-30', 'Apto'),
(7, 5, '2023-09-18', '2023-09-30', 'Apto'),

(8, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Flavia Amador
(8, 2, '2023-09-18', '2023-09-30', 'Apto'),
(8, 3, '2023-09-18', '2023-09-30', 'No Apto'),
(8, 4, '2023-09-18', '2023-09-30', 'Apto'),
(8, 5, '2023-09-18', '2023-09-30', 'Apto'),

(9, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Albino Macias
(9, 2, '2023-09-18', '2023-09-30', 'Apto'),
(9, 3, '2023-09-18', '2023-09-30', 'Apto'),
(9, 4, '2023-09-18', '2023-09-30', 'Apto'),
(9, 5, '2023-09-18', '2023-09-30', 'Apto'),

(10, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Ester Sánchez
(10, 2, '2023-09-18', '2023-09-30', 'Apto'),
(10, 3, '2023-09-18', '2023-09-30', 'Apto'),
(10, 4, '2023-09-18', '2023-09-30', 'No Apto'),
(10, 5, '2023-09-18', '2023-09-30', 'Apto'),

(11, 1, '2023-09-18', '2023-09-30', 'No Apto'), -- Luis Miguel Galvez
(11, 2, '2023-09-18', '2023-09-30', 'Apto'),
(11, 3, '2023-09-18', '2023-09-30', 'Apto'),
(11, 4, '2023-09-18', '2023-09-30', 'Apto'),
(11, 5, '2023-09-18', '2023-09-30', 'Apto'),

(12, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Loida Arellano
(12, 2, '2023-09-18', '2023-09-30', 'Apto'),
(12, 3, '2023-09-18', '2023-09-30', 'Apto'),
(12, 4, '2023-09-18', '2023-09-30', 'Apto'),
(12, 5, '2023-09-18', '2023-09-30', 'Apto'),

(13, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Heraclio Duque
(13, 2, '2023-09-18', '2023-09-30', 'Apto'),
(13, 3, '2023-09-18', '2023-09-30', 'No Apto'),
(13, 4, '2023-09-18', '2023-09-30', 'No Apto'),
(13, 5, '2023-09-18', '2023-09-30', 'No Apto'),

(14, 1, '2023-09-18', '2023-09-30', 'Apto'),   -- Herberto Figueras
(14, 2, '2023-09-18', '2023-09-30', 'Apto'),
(14, 3, '2023-09-18', '2023-09-30', 'Apto'),
(14, 4, '2023-09-18', '2023-09-30', 'Apto'),
(14, 5, '2023-09-18', '2023-09-30', 'Apto');



