create database IGLAI_SBD;
use IGLAI_SBD;
CREATE TABLE administrador (
    correo_admin VARCHAR(30) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono CHAR(10),
    fecha_nacimiento DATE,
    contrato VARCHAR(50)
);
CREATE TABLE tecnico (
    correo_tecni VARCHAR(30) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono CHAR(10),
    fecha_nacimiento DATE,
    contrato VARCHAR(50),
    correo_admin VARCHAR(30),
    FOREIGN KEY (correo_admin) REFERENCES administrador(correo_admin)
);

CREATE TABLE profesor (
    correo_profe VARCHAR(30) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono CHAR(10),
    profesion VARCHAR(50),
    fecha_nacimiento DATE,
    contrato VARCHAR(50),
    correo_admin VARCHAR(30),
    correo_tecni VARCHAR(30),
    FOREIGN KEY (correo_admin) REFERENCES administrador(correo_admin),
    FOREIGN KEY (correo_tecni) REFERENCES tecnico(correo_tecni)
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY NOT NULL,
    material_estudio VARCHAR(50),
    plan_estudio VARCHAR(50),
    cant_estudiante INT,
    nivel VARCHAR(50),
    horario VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    correo_profe VARCHAR(30),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe)
);

CREATE TABLE estudiante (
    correo_estu VARCHAR(30) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    telefono CHAR(10),
    direccion VARCHAR(50),
    fecha_nacimiento DATE,
    id_curso INT,
    correo_tecni VARCHAR(30),
    correo_profe VARCHAR(30),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (correo_tecni) REFERENCES tecnico(correo_tecni),
    FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe)
);

CREATE TABLE examen_nivelacion (
    id_examen INT PRIMARY KEY NOT NULL,
    calificacion DOUBLE NOT NULL,
    fecha DATE,
    nivel VARCHAR(50),
    correo_estu VARCHAR(30),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu)
);

CREATE TABLE actividades (
    id_tarea INT PRIMARY KEY NOT NULL,
    fecha_entrega DATE,
    calificacion DOUBLE,
    estado VARCHAR(50),
    correo_estu VARCHAR(30),
    id_curso INT,
    correo_profe VARCHAR(30),
	FOREIGN KEY (correo_profe) REFERENCES profesor(correo_profe),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE pago (
    id_pago INT PRIMARY KEY NOT NULL,
    monto DOUBLE,
    estado VARCHAR(50),
    correo_estu VARCHAR(30),
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu)
);

CREATE TABLE clase_grabada (
    id_clasegrabada INT PRIMARY KEY NOT NULL,
    fecha DATE,
    link VARCHAR(50),
    correo_estu VARCHAR(30),
    correo_profe VARCHAR(30),
    id_curso INT,
    FOREIGN KEY (correo_estu) REFERENCES estudiante(correo_estu),
    FOREIGN KEY (correo_profe) REFERENCES estudiante(correo_profe),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

Alter table profesor
ADD CONSTRAINT contrato CHECK (contrato IN ('temporal', 'completo'));
Alter table tecnico
ADD CONSTRAINT contrato CHECK (contrato IN ('temporal', 'completo'));
Alter table administrador
ADD CONSTRAINT contrato CHECK (contrato IN ('temporal', 'completo'));
Alter table curso
ADD CONSTRAINT tiponivel CHECK (nivel IN ('Children', 'teen', 'adults'));
Alter table examen_nivelacion
ADD CONSTRAINT tiponivel CHECK (nivel IN ('Children', 'teen', 'adults'));
Alter table actividades
ADD CONSTRAINT tipotarea CHECK (estado IN ('pendiente', 'completada', 'vencida'));
Alter table pago
ADD CONSTRAINT estadopago CHECK (estado IN ('pendiente','pagado'));

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
('mariana.sanchez@anai.edu.ec', 'Mariana Sanchez', '0934567890', 'Licenciada en Filología Inglesa', '1982-07-25', 'temporal', 'admin4@anai.edu.ec', 'tecni4@anai.edu.ec'),
('julio.ramirez@anai.edu.ec', 'Julio Ramirez', '0945678901', 'Doctor en Educación Bilingüe', '1976-12-30', 'completo', 'admin5@anai.edu.ec', 'tecni5@anai.edu.ec'),
('elena.fernandez@anai.edu.ec', 'Elena Fernandez', '0956789012', 'Licenciada en Lingüística Aplicada', '1979-04-14', 'temporal', 'admin6@anai.edu.ec', 'tecni6@anai.edu.ec'),
('manuel.gonzalez@anai.edu.ec', 'Manuel Gonzalez', '0967890123', 'Doctor en Educación Multicultural', '1981-06-22', 'completo', 'admin7@anai.edu.ec', 'tecni7@anai.edu.ec'),
('isabel.lopez@anai.edu.ec', 'Isabel Lopez', '0978901234', 'Licenciada en Educación Bilingüe', '1985-08-16', 'temporal', 'admin8@anai.edu.ec', 'tecni8@anai.edu.ec'),
('antonio.perez@anai.edu.ec', 'Antonio Perez', '0989012345', 'Doctor en Ciencias del Lenguaje', '1987-10-30', 'completo', 'admin9@anai.edu.ec', 'tecni9@anai.edu.ec'),
('patricia.morales@anai.edu.ec', 'Patricia Morales', '0990123456', 'Licenciada en Filología Inglesa', '1990-12-25', 'temporal', 'admin10@anai.edu.ec', 'tecni10@anai.edu.ec');

INSERT INTO curso (id_curso, material_estudio, plan_estudio, cant_estudiante, nivel, horario, fecha_inicio, fecha_fin, correo_profe) VALUES
(1, 'Material Básico de Inglés', 'Plan de Estudio Inicial', 20, 'Principiante', 'Lunes y Miércoles 10:00-12:00', '2024-01-15', '2024-06-15', 'miguel.rodriguez@anai.edu.ec'),
(2, 'Material Avanzado de Inglés', 'Plan de Estudio Avanzado', 15, 'Intermedio', 'Martes y Jueves 14:00-16:00', '2024-02-01', '2024-07-01', 'liliana.martinez@anai.edu.ec'),
(3, 'Introducción a la Lingüística', 'Plan de Estudio Lingüística', 25, 'Principiante', 'Lunes, Miércoles y Viernes 09:00-11:00', '2024-03-01', '2024-08-01', 'jorge.garcia@anai.edu.ec'),
(4, 'Gramática Inglesa', 'Plan de Estudio Gramática', 18, 'Intermedio', 'Lunes y Miércoles 13:00-15:00', '2024-04-01', '2024-09-01', 'mariana.sanchez@anai.edu.ec'),
(5, 'Literatura Inglesa', 'Plan de Estudio Literatura', 22, 'Avanzado', 'Martes y Jueves 11:00-13:00', '2024-05-01', '2024-10-01', 'julio.ramirez@anai.edu.ec'),
(6, 'Metodología de la Enseñanza', 'Plan de Estudio Metodología', 20, 'Principiante', 'Miércoles y Viernes 10:00-12:00', '2024-06-01', '2024-11-01', 'elena.fernandez@anai.edu.ec'),
(7, 'Fonética y Fonología', 'Plan de Estudio Fonética', 17, 'Intermedio', 'Lunes y Miércoles 15:00-17:00', '2024-07-01', '2024-12-01', 'manuel.gonzalez@anai.edu.ec'),
(8, 'Traducción y Comprensión', 'Plan de Estudio Traducción', 23, 'Avanzado', 'Martes y Jueves 12:00-14:00', '2024-08-01', '2025-01-01', 'isabel.lopez@anai.edu.ec'),
(9, 'Sociolingüística', 'Plan de Estudio Sociolingüística', 16, 'Principiante', 'Lunes y Miércoles 11:00-13:00', '2024-09-01', '2025-02-01', 'antonio.perez@anai.edu.ec'),
(10, 'Prácticas de Enseñanza', 'Plan de Estudio Prácticas', 30, 'Avanzado', 'Viernes 14:00-16:00', '2024-10-01', '2025-03-01', 'patricia.morales@anai.edu.ec');

INSERT INTO estudiante (correo_estu, nombre, telefono, direccion, fecha_nacimiento, id_curso, correo_tecni, correo_profe) VALUES
('estudiante1@anai.edu.ec', 'Estudiante Uno', '0987654321', 'Calle Falsa 123', '2005-05-15', 1, 'tecni1@anai.edu.ec', 'miguel.rodriguez@anai.edu.ec'),
('estudiante2@anai.edu.ec', 'Estudiante Dos', '0976543210', 'Avenida Siempre Viva 742', '2006-06-20', 2, 'tecni2@anai.edu.ec', 'liliana.martinez@anai.edu.ec'),
('estudiante3@anai.edu.ec', 'Estudiante Tres', '0965432109', 'Calle 42', '2007-07-25', 3, 'tecni3@anai.edu.ec', 'jorge.garcia@anai.edu.ec'),
('estudiante4@anai.edu.ec', 'Estudiante Cuatro', '0954321098', 'Avenida Libertad 33', '2008-08-30', 4, 'tecni4@anai.edu.ec', 'mariana.sanchez@anai.edu.ec'),
('estudiante5@anai.edu.ec', 'Estudiante Cinco', '0943210987', 'Calle del Sol 7', '2009-09-15', 5, 'tecni5@anai.edu.ec', 'julio.ramirez@anai.edu.ec'),
('estudiante6@anai.edu.ec', 'Estudiante Seis', '0932109876', 'Calle del Mar 4', '2010-10-20', 6, 'tecni6@anai.edu.ec', 'elena.fernandez@anai.edu.ec'),
('estudiante7@anai.edu.ec', 'Estudiante Siete', '0921098765', 'Avenida Norte 16', '2011-11-25', 7, 'tecni7@anai.edu.ec', 'manuel.gonzalez@anai.edu.ec'),
('estudiante8@anai.edu.ec', 'Estudiante Ocho', '0910987654', 'Calle del Río 8', '2012-12-30', 8, 'tecni8@anai.edu.ec', 'isabel.lopez@anai.edu.ec'),
('estudiante9@anai.edu.ec', 'Estudiante Nueve', '0909876543', 'Calle de la Luna 12', '2013-01-14', 9, 'tecni9@anai.edu.ec', 'antonio.perez@anai.edu.ec'),
('estudiante10@anai.edu.ec', 'Estudiante Diez', '0898765432', 'Calle del Viento 6', '2014-02-18', 10, 'tecni10@anai.edu.ec', 'patricia.morales@anai.edu.ec');

INSERT INTO examen_nivelacion (id_examen, calificacion, fecha, nivel, correo_estu) VALUES
(1, 85.5, '2024-02-20', 'Principiante', 'estudiante1@anai.edu.ec'),
(2, 90.0, '2024-03-15', 'Intermedio', 'estudiante2@anai.edu.ec'),
(3, 88.0, '2024-04-10', 'Avanzado', 'estudiante3@anai.edu.ec'),
(4, 77.5, '2024-05-25', 'Principiante', 'estudiante4@anai.edu.ec'),
(5, 92.0, '2024-06-30', 'Intermedio', 'estudiante5@anai.edu.ec'),
(6, 81.0, '2024-07-18', 'Avanzado', 'estudiante6@anai.edu.ec'),
(7, 84.5, '2024-08-05', 'Principiante', 'estudiante7@anai.edu.ec'),
(8, 89.0, '2024-09-12', 'Intermedio', 'estudiante8@anai.edu.ec'),
(9, 76.0, '2024-10-25', 'Avanzado', 'estudiante9@anai.edu.ec'),
(10, 93.0, '2024-11-10', 'Principiante', 'estudiante10@anai.edu.ec');

INSERT INTO actividades (id_tarea, fecha_entrega, calificacion, estado, correo_estu, id_curso, correo_profe) VALUES
(1, '2024-03-01', 80.0, 'Completada', 'estudiante1@anai.edu.ec', 1, 'miguel.rodriguez@anai.edu.ec'),
(2, '2024-04-01', 85.0, 'Completada', 'estudiante2@anai.edu.ec', 2, 'liliana.martinez@anai.edu.ec'),
(3, '2024-05-01', 90.0, 'Pendiente', 'estudiante3@anai.edu.ec', 3, 'jorge.garcia@anai.edu.ec'),
(4, '2024-06-01', 70.0, 'Completada', 'estudiante4@anai.edu.ec', 4, 'mariana.sanchez@anai.edu.ec'),
(5, '2024-07-01', 88.0, 'Completada', 'estudiante5@anai.edu.ec', 5, 'julio.ramirez@anai.edu.ec'),
(6, '2024-08-01', 76.0, 'Pendiente', 'estudiante6@anai.edu.ec', 6, 'elena.fernandez@anai.edu.ec'),
(7, '2024-09-01', 82.0, 'Completada', 'estudiante7@anai.edu.ec', 7, 'manuel.gonzalez@anai.edu.ec'),
(8, '2024-10-01', 91.0, 'Completada', 'estudiante8@anai.edu.ec', 8, 'isabel.lopez@anai.edu.ec'),
(9, '2024-11-01', 78.0, 'Pendiente', 'estudiante9@anai.edu.ec', 9, 'antonio.perez@anai.edu.ec'),
(10, '2024-12-01', 85.0, 'Completada', 'estudiante10@anai.edu.ec', 10, 'patricia.morales@anai.edu.ec');

INSERT INTO pago (id_pago, monto, estado, correo_estu) VALUES
(1, 150.00, 'Pagado', 'estudiante1@anai.edu.ec'),
(2, 200.00, 'Pendiente', 'estudiante2@anai.edu.ec'),
(3, 180.00, 'Pagado', 'estudiante3@anai.edu.ec'),
(4, 220.00, 'Pendiente', 'estudiante4@anai.edu.ec'),
(5, 170.00, 'Pagado', 'estudiante5@anai.edu.ec'),
(6, 190.00, 'Pendiente', 'estudiante6@anai.edu.ec'),
(7, 210.00, 'Pagado', 'estudiante7@anai.edu.ec'),
(8, 160.00, 'Pendiente', 'estudiante8@anai.edu.ec'),
(9, 230.00, 'Pagado', 'estudiante9@anai.edu.ec'),
(10, 240.00, 'Pendiente', 'estudiante10@anai.edu.ec');

INSERT INTO clase_grabada (id_clasegrabada, fecha, link, correo_estu, correo_profe, id_curso) VALUES
(1, '2024-01-10', 'http://example.com/clase1', 'estudiante1@anai.edu.ec', 'miguel.rodriguez@anai.edu.ec', 1),
(2, '2024-02-15', 'http://example.com/clase2', 'estudiante2@anai.edu.ec', 'liliana.martinez@anai.edu.ec', 2),
(3, '2024-03-20', 'http://example.com/clase3', 'estudiante3@anai.edu.ec', 'jorge.garcia@anai.edu.ec', 3),
(4, '2024-04-25', 'http://example.com/clase4', 'estudiante4@anai.edu.ec', 'mariana.sanchez@anai.edu.ec', 4),
(5, '2024-05-30', 'http://example.com/clase5', 'estudiante5@anai.edu.ec', 'julio.ramirez@anai.edu.ec', 5),
(6, '2024-06-15', 'http://example.com/clase6', 'estudiante6@anai.edu.ec', 'elena.fernandez@anai.edu.ec', 6),
(7, '2024-07-20', 'http://example.com/clase7', 'estudiante7@anai.edu.ec', 'manuel.gonzalez@anai.edu.ec', 7),
(8, '2024-08-25', 'http://example.com/clase8', 'estudiante8@anai.edu.ec', 'isabel.lopez@anai.edu.ec', 8),
(9, '2024-09-30', 'http://example.com/clase9', 'estudiante9@anai.edu.ec', 'antonio.perez@anai.edu.ec', 9),
(10, '2024-10-15', 'http://example.com/clase10', 'estudiante10@anai.edu.ec', 'patricia.morales@anai.edu.ec', 10);

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
