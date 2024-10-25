-- Insertar datos en la tabla vertical
INSERT INTO vertical (vertical_name) VALUES ('Desarrollo de Software'), ('Full Stack');

-- Insertar datos en la tabla promocion
INSERT INTO promocion (nombre) VALUES ('Septiembre'), ('Febrero');

-- Insertar datos en la tabla campus
INSERT INTO campus (campus_nombre) VALUES ('Madrid'), ('Valencia');

-- Insertar datos en la tabla modalidad
INSERT INTO modalidad (modalidad_id, tipo_modalidad) VALUES ('Presencial'), ('Online');


-- Insertar datos en la tabla claustro
INSERT INTO claustro (claustro_name, id_campus, id_modalidad, id_vertical) VALUES
('Noa Yáñez', 1, 1, 1),  -- TA, DS, Septiembre, Madrid, Presencial
('Saturnina Benitez', 1, 1, 1),
('Anna Feliu', 1, 1, 2),
('Rosalva Ayuso', 2, 1, 2),
('Ana Sofía Ferrer', 2, 1, 2),
('Angélica Corral', 1, 1, 2),
('Ariel Lledó', 1, 1, 1),
('Mario Prats', 2, 2, 2),
('Luis Ángel Suárez', 1, 2, 1),
('María Dolores Diaz', 1, 2, 1);


-- Insertar datos en la tabla TA
INSERT INTO ta (id_claustro) VALUES
(1),  -- Noa Yáñez
(2),  -- Saturnina Benitez
(3),  -- Anna Feliu
(4),  -- Rosalva Ayuso
(5),  -- Ana Sofía Ferrer
(6),  -- Angélica Corral
(7);  -- Ariel Lledó

-- Insertar datos en la tabla LI
INSERT INTO li (id_claustro) VALUES
(8),  -- Mario Prats
(9),  -- Luis Ángel Suárez
(10); -- María Dolores Diaz
