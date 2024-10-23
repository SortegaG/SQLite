

-- Consultas fáciles

-- Buscar todos los alumnos en un campus específico:

SELECT a.nombre, a.apellido, c.campus_nombre
FROM alumno AS a
INNER JOIN campus AS c ON a.id_campus = c.id_campus
WHERE c.campus_nombre = 'NombreDelCampus';


-- Buscar proyectos de un alumno específico:

SELECT p.nombre, p.calificacion, p.fecha_entrega, a.nombre, a.apellido
FROM proyectos AS p
INNER JOIN alumno AS a ON p.id_alumno = a.id_alumno
WHERE a.email = 'email_del_alumno';


-- Buscar todos los alumnos en una promoción específica:

SELECT nombre, apellido
FROM alumno
WHERE id_promocion = (SELECT id_promocion FROM promocion WHERE nombre = 'Promoción 2024');


-- Obtener todos los proyectos con sus fechas de entrega:

SELECT nombre, fecha_entrega
FROM proyectos;


-- Listar todos los claustros y su campus:

SELECT claustro_name, campus_nombre
FROM claustro
INNER JOIN campus ON claustro.id_campus = campus.id_campus;


------------------------------------------------------------------
------------------------------------------------------------------


-- Consultas intermedias

-- Obtener los nombres de los alumnos junto con su campus y promoción:

SELECT a.nombre, a.apellido, c.campus_nombre, p.nombre AS promocion
FROM alumno AS a
INNER JOIN campus AS c ON a.id_campus = c.id_campus
INNER JOIN promocion AS p ON a.id_promocion = p.id_promocion;


-- Listar todos los proyectos de una vertical específica y su calificación:

SELECT p.nombre, p.calificacion, v.vertical_name
FROM proyectos AS p
INNER JOIN vertical AS v ON p.id_vertical = v.id_vertical
WHERE v.vertical_name = 'Vertical de Ciencia';


-- Contar cuántos alumnos pertenecen a cada campus:

SELECT c.campus_nombre, COUNT(a.id_alumno) AS total_alumnos
FROM alumno AS a
INNER JOIN campus AS c ON a.id_campus = c.id_campus
GROUP BY c.campus_nombre;



------------------------------------------------------------------
------------------------------------------------------------------


-- Consultas avanzadas

-- Encontrar los alumnos que no tienen un proyecto asignado:

SELECT a.nombre, a.apellido
FROM alumno AS a
LEFT JOIN proyectos AS p ON a.id_alumno = p.id_alumno
WHERE p.id_alumno IS NULL;


-- Mostrar la calificación promedio de los proyectos por cada vertical:

SELECT v.vertical_name, AVG(p.calificacion) AS promedio_calificacion
FROM proyectos AS p
INNER JOIN vertical AS v ON p.id_vertical = v.id_vertical
GROUP BY v.vertical_name;


-- Obtener los 3 alumnos con las calificaciones más altas en proyectos:

SELECT a.nombre, a.apellido, p.calificacion
FROM alumno AS a
INNER JOIN proyectos AS p ON a.id_alumno = p.id_alumno
ORDER BY p.calificacion DESC
LIMIT 3;


------------------------------------------------------------------
------------------------------------------------------------------

-- Consultas complejas

-- Obtener el número total de proyectos por campus, incluyendo los proyectos que aún no tienen alumnos asignados:

SELECT c.campus_nombre, COUNT(p.id_proyecto) AS total_proyectos
FROM campus AS c
LEFT JOIN alumno AS a ON c.id_campus = a.id_campus
LEFT JOIN proyectos AS p ON a.id_alumno = p.id_alumno
GROUP BY c.campus_nombre;


-- Mostrar todos los alumnos junto con su TA, si tienen uno asignado:

SELECT a.nombre AS alumno_nombre, a.apellido AS alumno_apellido, ta.id_ta, claustro.claustro_name AS nombre_ta
FROM alumno AS a
LEFT JOIN ta ON a.id_ta = ta.id_ta
LEFT JOIN claustro ON ta.id_claustro = claustro.id_claustro;


-- Listar los proyectos con fecha de entrega en los próximos 30 días, junto con los datos del alumno y el TA asignado:

SELECT p.nombre AS proyecto_nombre, p.fecha_entrega, a.nombre AS alumno_nombre, a.apellido AS alumno_apellido, 
       claustro.claustro_name AS nombre_ta
FROM proyectos AS p
INNER JOIN alumno AS a ON p.id_alumno = a.id_alumno
LEFT JOIN ta ON a.id_ta = ta.id_ta
LEFT JOIN claustro ON ta.id_claustro = claustro.id_claustro
WHERE p.fecha_entrega BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30' DAY;


-- Encontrar el proyecto con la calificación más alta de cada vertical:

SELECT v.vertical_name, p.nombre AS proyecto_nombre, MAX(p.calificacion) AS calificacion_maxima
FROM proyectos AS p
INNER JOIN vertical AS v ON p.id_vertical = v.id_vertical
GROUP BY v.vertical_name;


-- Obtener el total de alumnos y proyectos por cada promoción:

SELECT promo.nombre AS promocion, COUNT(DISTINCT a.id_alumno) AS total_alumnos, COUNT(DISTINCT p.id_proyecto) AS total_proyectos
FROM promocion AS promo
LEFT JOIN alumno AS a ON promo.id_promocion = a.id_promocion
LEFT JOIN proyectos AS p ON a.id_alumno = p.id_alumno
GROUP BY promo.nombre;


-- Obtener los alumnos que están asignados a proyectos cuya calificación es mayor que el promedio de los proyectos de su vertical:

SELECT a.nombre, a.apellido, p.nombre AS proyecto_nombre, p.calificacion, v.vertical_name
FROM alumno AS a
INNER JOIN proyectos AS p ON a.id_alumno = p.id_alumno
INNER JOIN vertical AS v ON p.id_vertical = v.id_vertical
WHERE p.calificacion > (
  SELECT AVG(p2.calificacion)
  FROM proyectos AS p2
  WHERE p2.id_vertical = v.id_vertical
);


------------------------------------------------------------------
------------------------------------------------------------------

-- Consulta MEGADIFICIL

-- Objetivo:
-- Queremos obtener una lista de alumnos que cumplan las siguientes condiciones:

-- Han participado en más de un proyecto.
-- Su calificación promedio en los proyectos está en el cuartil superior (25% más alto) dentro de su vertical.
-- Además, tienen al menos un proyecto cuya fecha de entrega fue después de la fecha promedio de entrega de todos los proyectos de su promoción.
-- La lista debe incluir la siguiente información:
-- Nombre del alumno
-- Promedio de calificación en proyectos
-- Vertical en la que se encuentran
-- Número total de proyectos en los que participaron
-- Nombre del proyecto más reciente que hayan entregado.

WITH alumnos_con_proyectos AS (
  -- 1. Alumnos que han participado en más de un proyecto
  SELECT a.id_alumno, a.nombre, a.apellido, v.vertical_name, COUNT(p.id_proyecto) AS total_proyectos,
         AVG(p.calificacion) AS promedio_calificacion, MAX(p.fecha_entrega) AS fecha_entrega_reciente
  FROM alumno AS a
  INNER JOIN proyectos AS p ON a.id_alumno = p.id_alumno
  INNER JOIN vertical AS v ON a.id_vertical = v.id_vertical
  GROUP BY a.id_alumno, a.nombre, a.apellido, v.vertical_name
  HAVING COUNT(p.id_proyecto) > 1
),
cuartil_superior AS (
  -- 2. Identificar alumnos en el cuartil superior (25%) de calificación promedio dentro de su vertical
  SELECT id_alumno, nombre, apellido, vertical_name, total_proyectos, promedio_calificacion, fecha_entrega_reciente
  FROM (
    SELECT id_alumno, nombre, apellido, vertical_name, total_proyectos, promedio_calificacion, fecha_entrega_reciente,
           NTILE(4) OVER (PARTITION BY vertical_name ORDER BY promedio_calificacion DESC) AS cuartil
    FROM alumnos_con_proyectos
  ) AS alumnos_cuartiles
  WHERE cuartil = 1
),
promedio_fecha_promocion AS (
  -- 3. Calcular la fecha promedio de entrega de proyectos por promoción
  SELECT p.id_promocion, AVG(p.fecha_entrega) AS promedio_fecha_entrega
  FROM proyectos AS p
  GROUP BY p.id_promocion
)
-- 4. Obtener los alumnos que cumplen las condiciones anteriores
SELECT c.id_alumno, c.nombre, c.apellido, c.vertical_name, c.total_proyectos, c.promedio_calificacion,
       p.nombre AS nombre_proyecto_mas_reciente, c.fecha_entrega_reciente
FROM cuartil_superior AS c
INNER JOIN alumno AS a ON c.id_alumno = a.id_alumno
INNER JOIN proyectos AS p ON a.id_alumno = p.id_alumno
INNER JOIN promocion AS promo ON a.id_promocion = promo.id_promocion
INNER JOIN promedio_fecha_promocion AS pf ON promo.id_promocion = pf.id_promocion
-- 5. Condición: Fecha de entrega reciente mayor a la fecha promedio de entrega de su promoción
WHERE c.fecha_entrega_reciente > pf.promedio_fecha_entrega
ORDER BY c.promedio_calificacion DESC;


------------------------------------------------------------------
------------------------------------------------------------------


-- Insertar datos de ejemplo

-- Insertar en la tabla CAMPUS
INSERT INTO campus (campus_nombre)
VALUES ('Campus Madrid'), ('Campus Barcelona');

-- Insertar en la tabla MODALIDAD
INSERT INTO modalidad (mes, fecha)
VALUES ('Enero', '2024-01-01'), ('Febrero', '2024-02-01');

-- Insertar en la tabla PROMOCIÓN
INSERT INTO promocion (nombre)
VALUES ('Promoción 2024');

-- Insertar en la tabla ALUMNO
INSERT INTO alumno (nombre, apellido, email, id_campus, id_promocion, id_modalidad, id_vertical, id_ta)
VALUES ('Juan', 'Pérez', 'juan.perez@example.com', 1, 1, 1, 1, 1);


------------------------------------------------------------------
------------------------------------------------------------------




