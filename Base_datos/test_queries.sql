--1. Retrieve all students and their campus details:
SELECT a.nombre, a.apellido, c.campus_nombre
FROM alumnos a
JOIN campus c ON a.campus_id = c.campus_id;
-- 2. List of all projects with the corresponding vertical and promotion:
SELECT p.proyecto_nombre, v.vertical_name, pr.promocion_nombre
FROM proyectos p
JOIN vertical v ON p.vertical_id = v.vertical_id
JOIN promocion pr ON p.promocion_id = pr.promocion_id;
--3. Retrieve all students and their corresponding teaching assistant:
SELECT a.nombre, a.apellido, c.nombre_docente AS teaching_assistant
FROM alumnos a
JOIN teaching_assistant ta ON a.teaching_assistant_id = ta.teaching_assistant_id
JOIN claustro c ON ta.docente_id = c.docente_id;
-- 4. Retrieve the grades of a student in all their projects:
SELECT a.nombre, a.apellido, p.proyecto_nombre, ep.calificacion
FROM alumnos a
JOIN estudiante_proyectos ep ON a.alumno_id = ep.alumno_id
JOIN proyectos p ON ep.proyecto_id = p.proyecto_id
WHERE a.email = 'jafet_casals@gmail.com';
--5. Retrieve the students assigned to a specific lead instructor:
SELECT a.nombre, a.apellido, li.nombre_docente AS lead_instructor
FROM alumnos a
JOIN lead_instructor li ON a.lead_instructor_id = li.lead_instructor_id
JOIN claustro c ON li.docente_id = c.docente_id
WHERE c.nombre_docente = 'luis angel suarez';
-- 6. Find all students who failed at least one project:
SELECT DISTINCT a.nombre, a.apellido
FROM alumnos a
JOIN estudiante_proyectos ep ON a.alumno_id = ep.alumno_id
WHERE ep.calificacion = 'No Apto';
--7. List all teaching assistants and the number of students they assist:
SELECT c.nombre_docente AS teaching_assistant, COUNT(a.alumno_id) AS num_students
FROM claustro c
JOIN teaching_assistant ta ON c.docente_id = ta.docente_id
JOIN alumnos a ON a.teaching_assistant_id = ta.teaching_assistant_id
GROUP BY c.nombre_docente;
--8. Find the total number of projects completed by students in each promotion:
SELECT pr.promocion_nombre, COUNT(ep.proyecto_id) AS total_projects_completed
FROM promocion pr
JOIN proyectos p ON pr.promocion_id = p.promocion_id
JOIN estudiante_proyectos ep ON p.proyecto_id = ep.proyecto_id
GROUP BY pr.promocion_nombre;
-- 9. Retrieve all students along with the vertical and the campus they are enrolled in:
SELECT a.nombre, a.apellido, v.vertical_name, c.campus_nombre
FROM alumnos a
JOIN vertical v ON a.vertical_id = v.vertical_id
JOIN campus c ON a.campus_id = c.campus_id;
-- 10. Retrieve all the details of students who are part of the "data_science" vertical:
SELECT a.nombre, a.apellido, v.vertical_name, p.promocion_nombre, ca.campus_nombre
FROM alumnos a
JOIN vertical v ON a.vertical_id = v.vertical_id
JOIN promocion p ON a.promocion_id = p.promocion_id
JOIN campus ca ON a.campus_id = ca.campus_id
WHERE v.vertical_name = 'data_science';