-- #################################################
-- Creación del Schema y uso de la base de datos
-- #################################################
DROP SCHEMA IF EXISTS SoundWaveDB_CoderHouse;
CREATE SCHEMA IF NOT EXISTS SoundWaveDB_CoderHouse;
USE SoundWaveDB_CoderHouse;

-- #################################################
-- Creación de las tablas (nombres en singular)
-- #################################################
CREATE TABLE genero (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(80) NOT NULL UNIQUE,
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  pais VARCHAR(15)
);

CREATE TABLE artista (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  genero_id BIGINT,
  FOREIGN KEY (genero_id) REFERENCES genero(id)
);

CREATE TABLE album (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50) NOT NULL,
  artista_id BIGINT,
  fecha_lanzamiento DATE,
  FOREIGN KEY (artista_id) REFERENCES artista(id)
);

CREATE TABLE cancion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50) NOT NULL,
  duracion TIME, 
  album_id BIGINT,
  FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE lista_reproduccion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  usuario_id BIGINT,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE historial_reproduccion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  usuario_id BIGINT,
  cancion_id BIGINT,
  fecha_reproduccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (cancion_id) REFERENCES cancion(id)
);

CREATE TABLE suscripcion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  usuario_id BIGINT,
  tipo VARCHAR(15) NOT NULL,
  fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_fin TIMESTAMP NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE comentario (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  usuario_id BIGINT,
  cancion_id BIGINT,
  comentario VARCHAR(300) NOT NULL,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (cancion_id) REFERENCES cancion(id)
);

CREATE TABLE colaboracion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  artista_principal_id BIGINT,
  artista_colaborador_id BIGINT,
  cancion_id BIGINT,
  FOREIGN KEY (artista_principal_id) REFERENCES artista(id),
  FOREIGN KEY (artista_colaborador_id) REFERENCES artista(id),
  FOREIGN KEY (cancion_id) REFERENCES cancion(id)
);

CREATE TABLE evento (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  artista_id BIGINT,
  nombre VARCHAR(50) NOT NULL,
  fecha TIMESTAMP,
  lugar VARCHAR(15),
  FOREIGN KEY (artista_id) REFERENCES artista(id)
);

CREATE TABLE lista_reproduccion_cancion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  lista_reproduccion_id BIGINT,
  cancion_id BIGINT,
  orden INT,
  FOREIGN KEY (lista_reproduccion_id) REFERENCES lista_reproduccion(id),
  FOREIGN KEY (cancion_id) REFERENCES cancion(id)
);

CREATE TABLE favorito_cancion (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  usuario_id BIGINT,
  cancion_id BIGINT,
  fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (cancion_id) REFERENCES cancion(id)
);

CREATE TABLE favorito_album (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  usuario_id BIGINT,
  album_id BIGINT,
  fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (album_id) REFERENCES album(id)
);