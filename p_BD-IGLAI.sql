CREATE DATABASE IGLAI1111;
USE IGLAI1111;

CREATE TABLE administrador (
    correo_admin VARCHAR(50) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(10),
    fecha_nacimiento DATE,
    contrato VARCHAR(50)
);

CREATE TABLE tecnico (
    correo_tecni VARCHAR(50) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(10),
    fecha_nacimiento DATE,
    contrato VARCHAR(50),
    correo_admin VARCHAR(50),
    FOREIGN KEY (correo_admin) REFERENCES administrador(correo_admin)
);

CREATE TABLE profesor (
    correo_profe VARCHAR(50) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(10),
    profesion VARCHAR(50),
    fecha_nacimiento DATE,
    contrato VARCHAR(50),
    correo_admin VARCHAR(50),
    correo_tecni VARCHAR(50),
    FOREIGN KEY (correo_admin) REFERENCES administrador(correo_admin),
    FOREIGN KEY (correo_tecni) REFERENCES tecnico(correo_tecni)
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY NOT NULL,
    material_estudio VARCHAR(100),
    plan_estudio VARCHAR(100),
    cant_estudiante INT,
    nivel VARCHAR(50),
    horario VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    correo_profe VARCHAR(50),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe)
);

CREATE TABLE estudiante (
    correo_estu VARCHAR(50) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(10),
    direccion VARCHAR(100),
    fecha_nacimiento DATE,
    id_curso INT,
    correo_tecni VARCHAR(50),
    correo_profe VARCHAR(50),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (correo_tecni) REFERENCES tecnico(correo_tecni),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe)
);

CREATE TABLE examen_nivelacion (
    id_examen INT PRIMARY KEY NOT NULL,
    calificacion DOUBLE NOT NULL,
    fecha DATE,
    nivel VARCHAR(50),
    correo_estu VARCHAR(50),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu)
);

CREATE TABLE actividades (
    id_tarea INT PRIMARY KEY NOT NULL,
    fecha_entrega DATE,
    calificacion DOUBLE,
    estado VARCHAR(50),
    correo_estu VARCHAR(50),
    id_curso INT,
    correo_profe VARCHAR(50),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE pago (
    id_pago INT PRIMARY KEY NOT NULL,
    monto DOUBLE,
    estado VARCHAR(50),
    correo_estu VARCHAR(50),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu)
);

CREATE TABLE clase_grabada (
    id_clasegrabada INT PRIMARY KEY NOT NULL,
    fecha DATE,
    link VARCHAR(100),
    correo_estu VARCHAR(50),
    correo_profe VARCHAR(50),
    id_curso INT,
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

ALTER TABLE profesor
ADD CONSTRAINT contrato_profesor CHECK (contrato IN ('temporal', 'completo'));
ALTER TABLE tecnico
ADD CONSTRAINT contrato_tecnico CHECK (contrato IN ('temporal', 'completo'));
ALTER TABLE administrador
ADD CONSTRAINT contrato_administrador CHECK (contrato IN ('temporal', 'completo'));
ALTER TABLE curso
ADD CONSTRAINT tiponivel_curso CHECK (nivel IN ('Children', 'teen', 'adults'));
ALTER TABLE examen_nivelacion
ADD CONSTRAINT tiponivel_examen CHECK (nivel IN ('Children', 'teen', 'adults'));
ALTER TABLE actividades
ADD CONSTRAINT tipotarea_actividades CHECK (estado IN ('pendiente', 'completada', 'vencida'));
ALTER TABLE pago
ADD CONSTRAINT estadopago_pago CHECK (estado IN ('pendiente', 'pagado'));

-- Inserciones
INSERT INTO administrador (correo_admin, nombre, telefono, fecha_nacimiento, contrato) VALUES
('admin1@anai.edu.ec', 'Admin Uno', '0900000001', '1970-01-01', 'completo'),
('admin2@anai.edu.ec', 'Admin Dos', '0900000002', '1971-02-02', 'temporal'),
('admin3@anai.edu.ec', 'Admin Tres', '0900000003', '1972-03-03', 'completo'),
('admin4@anai.edu.ec', 'Admin Cuatro', '0900000004', '1973-04-04', 'temporal'),
('admin5@anai.edu.ec', 'Admin Cinco', '0900000005', '1974-05-05', 'completo'),
('admin6@anai.edu.ec', 'Admin Seis', '0900000006', '1975-06-06', 'temporal'),
('admin7@anai.edu.ec', 'Admin Siete', '0900000007', '1976-07-07', 'completo'),
('admin8@anai.edu.ec', 'Admin Ocho', '0900000008', '1977-08-08', 'temporal'),
('admin9@anai.edu.ec', 'Admin Nueve', '0900000009', '1978-09-09', 'completo'),
('admin10@anai.edu.ec', 'Admin Diez', '0900000010', '1979-10-10', 'temporal');

INSERT INTO tecnico (correo_tecni, nombre, telefono, fecha_nacimiento, contrato, correo_admin) VALUES
('tecni1@anai.edu.ec', 'Tecni Uno', '0910000001', '1980-01-01', 'completo', 'admin1@anai.edu.ec'),
('tecni2@anai.edu.ec', 'Tecni Dos', '0910000002', '1981-02-02', 'temporal', 'admin2@anai.edu.ec'),
('tecni3@anai.edu.ec', 'Tecni Tres', '0910000003', '1982-03-03', 'completo', 'admin3@anai.edu.ec'),
('tecni4@anai.edu.ec', 'Tecni Cuatro', '0910000004', '1983-04-04', 'temporal', 'admin4@anai.edu.ec'),
('tecni5@anai.edu.ec', 'Tecni Cinco', '0910000005', '1984-05-05', 'completo', 'admin5@anai.edu.ec'),
('tecni6@anai.edu.ec', 'Tecni Seis', '0910000006', '1985-06-06', 'temporal', 'admin6@anai.edu.ec'),
('tecni7@anai.edu.ec', 'Tecni Siete', '0910000007', '1986-07-07', 'completo', 'admin7@anai.edu.ec'),
('tecni8@anai.edu.ec', 'Tecni Ocho', '0910000008', '1987-08-08', 'temporal', 'admin8@anai.edu.ec'),
('tecni9@anai.edu.ec', 'Tecni Nueve', '0910000009', '1988-09-09', 'completo', 'admin9@anai.edu.ec'),
('tecni10@anai.edu.ec', 'Tecni Diez', '0910000010', '1989-10-10', 'temporal', 'admin10@anai.edu.ec');

INSERT INTO profesor (correo_profe, nombre, telefono, profesion, fecha_nacimiento, contrato, correo_admin, correo_tecni) VALUES
('miguel.rodriguez@anai.edu.ec', 'Miguel Rodriguez', '0901234567', 'Doctor en Lenguas Extranjeras', '1975-05-15', 'completo', 'admin1@anai.edu.ec', 'tecni1@anai.edu.ec'),
('liliana.martinez@anai.edu.ec', 'Liliana Martinez', '0912345678', 'Licenciada en Lenguas Extranjeras', '1980-09-20', 'temporal', 'admin2@anai.edu.ec', 'tecni2@anai.edu.ec'),
('jorge.garcia@anai.edu.ec', 'Jorge Garcia', '0923456789', 'Doctor en Lingüística Aplicada', '1978-03-10', 'completo', 'admin3@anai.edu.ec', 'tecni3@anai.edu.ec'),
('carmen.lopez@anai.edu.ec', 'Carmen Lopez', '0934567890', 'Licenciada en Educación', '1985-08-25', 'temporal', 'admin4@anai.edu.ec', 'tecni4@anai.edu.ec'),
('alejandro.ramos@anai.edu.ec', 'Alejandro Ramos', '0945678901', 'Doctor en Literatura Inglesa', '1972-12-05', 'completo', 'admin5@anai.edu.ec', 'tecni5@anai.edu.ec');

INSERT INTO curso (id_curso, material_estudio, plan_estudio, cant_estudiante, nivel, horario, fecha_inicio, fecha_fin, correo_profe) VALUES
(1, 'Material1', 'Plan1', 15, 'Children', 'Lunes a Viernes 08:00-10:00', '2023-01-15', '2023-06-15', 'miguel.rodriguez@anai.edu.ec'),
(2, 'Material2', 'Plan2', 20, 'Teen', 'Lunes a Viernes 10:00-12:00', '2023-01-15', '2023-06-15', 'liliana.martinez@anai.edu.ec'),
(3, 'Material3', 'Plan3', 10, 'Adults', 'Lunes a Viernes 14:00-16:00', '2023-01-15', '2023-06-15', 'jorge.garcia@anai.edu.ec'),
(4, 'Material4', 'Plan4', 12, 'Children', 'Lunes a Viernes 08:00-10:00', '2023-07-01', '2023-12-15', 'carmen.lopez@anai.edu.ec'),
(5, 'Material5', 'Plan5', 18, 'Teen', 'Lunes a Viernes 10:00-12:00', '2023-07-01', '2023-12-15', 'alejandro.ramos@anai.edu.ec');

INSERT INTO estudiante (correo_estu, nombre, telefono, direccion, fecha_nacimiento, id_curso, correo_tecni, correo_profe) VALUES
('alumno1@anai.edu.ec', 'Alumno Uno', '0956789012', 'Direccion 1', '2005-05-15', 1, 'tecni1@anai.edu.ec', 'miguel.rodriguez@anai.edu.ec'),
('alumno2@anai.edu.ec', 'Alumno Dos', '0967890123', 'Direccion 2', '2003-07-25', 2, 'tecni2@anai.edu.ec', 'liliana.martinez@anai.edu.ec'),
('alumno3@anai.edu.ec', 'Alumno Tres', '0978901234', 'Direccion 3', '1988-11-12', 3, 'tecni3@anai.edu.ec', 'jorge.garcia@anai.edu.ec'),
('alumno4@anai.edu.ec', 'Alumno Cuatro', '0989012345', 'Direccion 4', '2010-02-20', 4, 'tecni4@anai.edu.ec', 'carmen.lopez@anai.edu.ec'),
('alumno5@anai.edu.ec', 'Alumno Cinco', '0990123456', 'Direccion 5', '2006-08-30', 5, 'tecni5@anai.edu.ec', 'alejandro.ramos@anai.edu.ec');

INSERT INTO examen_nivelacion (id_examen, calificacion, fecha, nivel, correo_estu) VALUES
(1, 8.5, '2023-01-10', 'Children', 'alumno1@anai.edu.ec'),
(2, 7.0, '2023-01-10', 'Teen', 'alumno2@anai.edu.ec'),
(3, 9.0, '2023-01-10', 'Adults', 'alumno3@anai.edu.ec'),
(4, 8.0, '2023-06-25', 'Children', 'alumno4@anai.edu.ec'),
(5, 7.5, '2023-06-25', 'Teen', 'alumno5@anai.edu.ec');

INSERT INTO actividades (id_tarea, fecha_entrega, calificacion, estado, correo_estu, id_curso, correo_profe) VALUES
(1, '2023-02-01', 9.0, 'completada', 'alumno1@anai.edu.ec', 1, 'miguel.rodriguez@anai.edu.ec'),
(2, '2023-02-15', 8.0, 'completada', 'alumno2@anai.edu.ec', 2, 'liliana.martinez@anai.edu.ec'),
(3, '2023-03-01', 7.5, 'completada', 'alumno3@anai.edu.ec', 3, 'jorge.garcia@anai.edu.ec'),
(4, '2023-07-15', 8.5, 'pendiente', 'alumno4@anai.edu.ec', 4, 'carmen.lopez@anai.edu.ec'),
(5, '2023-08-01', 9.0, 'pendiente', 'alumno5@anai.edu.ec', 5, 'alejandro.ramos@anai.edu.ec');

INSERT INTO pago (id_pago, monto, estado, correo_estu) VALUES
(1, 200.00, 'pagado', 'alumno1@anai.edu.ec'),
(2, 250.00, 'pendiente', 'alumno2@anai.edu.ec'),
(3, 300.00, 'pagado', 'alumno3@anai.edu.ec'),
(4, 150.00, 'pendiente', 'alumno4@anai.edu.ec'),
(5, 100.00, 'pagado', 'alumno5@anai.edu.ec');

INSERT INTO clase_grabada (id_clasegrabada, fecha, link, correo_estu, correo_profe, id_curso) VALUES
(1, '2023-02-15', 'http://anai.edu.ec/clase1', 'alumno1@anai.edu.ec', 'miguel.rodriguez@anai.edu.ec', 1),
(2, '2023-03-01', 'http://anai.edu.ec/clase2', 'alumno2@anai.edu.ec', 'liliana.martinez@anai.edu.ec', 2),
(3, '2023-03-15', 'http://anai.edu.ec/clase3', 'alumno3@anai.edu.ec', 'jorge.garcia@anai.edu.ec', 3),
(4, '2023-07-15', 'http://anai.edu.ec/clase4', 'alumno4@anai.edu.ec', 'carmen.lopez@anai.edu.ec', 4),
(5, '2023-08-01', 'http://anai.edu.ec/clase5', 'alumno5@anai.edu.ec', 'alejandro.ramos@anai.edu.ec', 5);

-- Consultas
SELECT nombre, telefono, direccion FROM estudiante WHERE id_curso = 1;

SELECT nombre, telefono FROM profesor WHERE contrato = 'completo';
SELECT nivel, material_estudio, plan_estudio, cant_estudiante, horario, fecha_inicio, fecha_fin 
FROM curso 
ORDER BY nivel;
-- listar las tareas asignadas a los estudiantes donde se indique descripción, fecha de entrega, calificación y estado
SELECT a.id_tarea, a.fecha_entrega, a.calificacion, a.estado, e.nombre AS estudiante, c.nivel AS curso 
FROM actividades a
JOIN estudiante e ON a.correo_estu = e.correo_estu
JOIN curso c ON a.id_curso = c.id_curso;

-- Obtener todos los exámenes y sus calificaciones asociadas de un estudiante
SELECT e.nombre AS estudiante_nombre, en.calificacion, en.fecha
FROM estudiante e
JOIN examen_nivelacion en ON e.correo_estu = en.correo_estu
WHERE e.correo_estu = 'estudiante1@anai.edu.ec';

-- Actualizar la Cantidad de Estudiantes en un Curso
DELIMITER $$

CREATE TRIGGER update_student_count AFTER INSERT ON estudiante
FOR EACH ROW
BEGIN
    UPDATE curso
    SET cant_estudiante = cant_estudiante + 1
    WHERE id_curso = NEW.id_curso;
END$$

DELIMITER ;
-- administrador 
-- leer informacion 
SELECT e.nombre AS estudiante, e.telefono, e.direccion, e.fecha_nacimiento, 
       c.material_estudio, c.plan_estudio, c.nivel, c.horario,
       p.nombre AS profesor, t.nombre AS tecnico
FROM estudiante e
JOIN curso c ON e.id_curso = c.id_curso
JOIN profesor p ON c.correo_profe = p.correo_profe
JOIN tecnico t ON e.correo_tecni = t.correo_tecni
WHERE e.correo_estu = 'nuevo_estudiante@ejemplo.com';


-- obtener el nombre del administrador y el nombre de los técnicos que dependen de él
SELECT a.nombre AS Administrador, t.nombre AS Técnico
FROM administrador a
JOIN tecnico t ON a.correo_admin = t.correo_admin;
-- actualizar un registro en la tabla administrador
UPDATE administrador
SET telefono = '0987654321'
WHERE correo_admin = 'admin1@ejemplo.com';
--


-- actualiza la fecha de nacimiento del administrador a la fecha actual cada vez que se 
-- inserta un nuevo técnico en la tabla tecnico
DELIMITER //

CREATE TRIGGER actualizar_fecha_admin
AFTER INSERT ON tecnico
FOR EACH ROW
BEGIN
    UPDATE administrador
    SET fecha_nacimiento = CURDATE()
    WHERE correo_admin = NEW.correo_admin;
END;
//

DELIMITER ;
-- tecnico 

-- obtener el nombre del técnico junto con el nombre del administrador al que está asignado
SELECT t.nombre AS Técnico, a.nombre AS Administrador
FROM tecnico t
JOIN administrador a ON t.correo_admin = a.correo_admin;

--
SELECT nombre
FROM tecnico
WHERE correo_admin IN (
    SELECT correo_admin
    FROM administrador
    WHERE contrato = 'Contrato1'
);
-- actualizar un registro en la tabla tecnico
UPDATE tecnico
SET telefono = '0987654321'
WHERE correo_tecni = 'tecni1@ejemplo.com';

-- eliminar un registro en la tabla tecnico
DELETE FROM tecnico
WHERE correo_tecni = 'tecni1@ejemplo.com';

-- Actualiza la tabla tecnico y obtiene el valor valor del contrato desde la tabla 'administrador
DELIMITER //

CREATE TRIGGER sincronizar_contrato_tecni
AFTER INSERT ON tecnico
FOR EACH ROW
BEGIN
    UPDATE tecnico
    SET contrato = (
        SELECT contrato
        FROM administrador
        WHERE correo_admin = NEW.correo_admin
    )
    WHERE correo_tecni = NEW.correo_tecni;
END;
//

DELIMITER ;
-- curso 
UPDATE curso
SET nombre_curso = 'Material11'
WHERE id_curso = 1;
-- borrar 
DELETE FROM curso WHERE id_curso = 1;
-- actualizar el nombre de la actividad relacionada cuando se actualice el curso
DELIMITER //

CREATE TRIGGER actualizar_actividad_curso
AFTER UPDATE ON curso
FOR EACH ROW
BEGIN
    UPDATE actividades
    SET descripcion = CONCAT('Actualización en el curso: ', NEW.nombre_curso)
    WHERE id_curso = OLD.id_curso;
END;
//

DELIMITER ;
-- estudiante
--  mostrar exámenes asociados a cada estudiante
SELECT e.id_estudiante, e.nombre_estudiante, ex.fecha, ex.resultado
FROM estudiante e
LEFT JOIN examen_nivelacion ex ON e.id_estudiante = ex.id_estudiante;

-- Actualizar
UPDATE estudiante
SET nombre_estudiante = 'Carlos Ruiz Gómez'
WHERE id_estudiante = 1;
-- Borrar
DELETE FROM estudiante WHERE id_estudiante = 1;
-- actualizar el resultado de un examen cuando se inserte un nuevo estudiante
DELIMITER //

CREATE TRIGGER actualizar_resultado_examen
AFTER INSERT ON estudiante
FOR EACH ROW
BEGIN
    INSERT INTO examen_nivelacion (id_estudiante, fecha, resultado)
    VALUES (NEW.id_estudiante, CURDATE(), 'Pendiente');
END;
//

DELIMITER ;
-- examen de nivelacion 
-- mostrar resultados de exámenes y estudiantes
SELECT ex.id_examen, e.nombre_estudiante, ex.fecha, ex.resultado
FROM examen_nivelacion ex
JOIN estudiante e ON ex.id_estudiante = e.id_estudiante;
-- actualizar 
UPDATE examen_nivelacion
SET resultado = 'Reprobado'
WHERE id_examen = 1;
-- borrar 
DELETE FROM examen_nivelacion WHERE id_examen = 1;
-- para notificar al estudiante cuando el resultado del examen cambie.
DELIMITER //

CREATE TRIGGER notificar_cambio_resultado
AFTER UPDATE ON examen_nivelacion
FOR EACH ROW
BEGIN
    INSERT INTO notificaciones (id_estudiante, mensaje, fecha)
    VALUES (NEW.id_estudiante, CONCAT('Tu resultado ha cambiado a: ', NEW.resultado), NOW());
END;
//

DELIMITER ;

--  actividades
-- para mostrar actividades y el curso asociado
SELECT a.id_actividad, c.nombre_curso, a.descripcion, a.fecha
FROM actividades a
JOIN curso c ON a.id_curso = c.id_curso;
-- borrar 
DELETE FROM actividades WHERE id_actividad = 1;

-- profesor 
-- mostrar cursos asociados a cada profesor)
SELECT p.id_profesor, p.nombre, p.email, c.nombre_curso
FROM profesor p
LEFT JOIN curso c ON p.id_profesor = c.id_profesor;
-- actualizar 
UPDATE profesor
SET nombre = 'Laura Fernández González'
WHERE id_profesor = 1;

-- borrar
DELETE FROM profesor WHERE id_profesor = 1;

-- para registrar en una tabla de logs cuando se actualice el nombre de un profesor.
DELIMITER //

CREATE TRIGGER log_profesor_update
AFTER UPDATE ON profesor
FOR EACH ROW
BEGIN
    INSERT INTO log_changes (tabla, id_registro, tipo_cambio, fecha)
    VALUES ('profesor', OLD.id_profesor, 'Actualización de nombre', NOW());
END;
//

DELIMITER ;
