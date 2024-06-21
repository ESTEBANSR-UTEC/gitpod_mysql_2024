DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;

USE prueba;

-- prueba.materias definition
CREATE TABLE materias (
  id_materia int NOT NULL AUTO_INCREMENT,
  nombre_materia varchar(100) NOT NULL,
  cuatrimestre int NOT NULL,
  grupo varchar(100) NOT NULL,
  PRIMARY KEY (id_materia)
);

-- prueba.temas definition
CREATE TABLE temas (
  id_tema int NOT NULL AUTO_INCREMENT,
  tema varchar(100) NOT NULL,
  dificultad int NOT NULL,
  id_materia int NOT NULL,
  id_temas int DEFAULT NULL,
  PRIMARY KEY (id_tema),
  KEY temas_materias_fk (id_materia),
  CONSTRAINT temas_materias_fk FOREIGN KEY (id_materia) REFERENCES materias (id_materia) ON DELETE CASCADE ON UPDATE CASCADE
);

-- prueba.preguntas definition
CREATE TABLE preguntas (
  id_pregunta varchar(100) NOT NULL,
  pregunta varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  id_tema int NOT NULL,
  PRIMARY KEY (id_pregunta),
  KEY preguntas_temas_fk (id_tema),
  CONSTRAINT preguntas_temas_fk FOREIGN KEY (id_tema) REFERENCES temas (id_tema) ON DELETE CASCADE ON UPDATE CASCADE
);

-- prueba.respuestas definition
CREATE TABLE respuestas (
  id_respuesta int NOT NULL AUTO_INCREMENT,
  id_pregunta varchar(100) NOT NULL,
  respuesta varchar(255) NOT NULL,
  ia varchar(50) DEFAULT NULL,
  calidad_prompt INT NOT NULL,
  calidad_respuesta int DEFAULT NULL,
  PRIMARY KEY (id_respuesta),
  KEY respuestas_preguntas_fk (id_pregunta),
  CONSTRAINT respuestas_preguntas_fk FOREIGN KEY (id_pregunta) REFERENCES preguntas (id_pregunta) ON DELETE CASCADE ON UPDATE CASCADE
);

LOAD DATA LOCAL INFILE "Dase de Batos - materia.csv"
INTO TABLE materias
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "Dase de Batos - temas.csv"
INTO TABLE temas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "Dase de Batos - preguntas.csv"
INTO TABLE preguntas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "Dase de Batos - respuestas (1).csv"
INTO TABLE respuestas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM materias;
SELECT * FROM temas;
SELECT * FROM preguntas;
SELECT * FROM respuestas;