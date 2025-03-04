-- #################################################
-- Creacion de Vistas 
-- #################################################

-- Vista: Informacion de usuario, comentario y cancion
CREATE OR REPLACE VIEW vw_usuario_comentario AS
SELECT u.nombre AS usuario, c.comentario, ca.titulo AS cancion
FROM comentario c
JOIN usuario u ON c.usuario_id = u.id
JOIN cancion ca ON c.cancion_id = ca.id;

-- Vista: Artista y sus Albumes
CREATE OR REPLACE VIEW vw_artista_album AS
SELECT a.nombre AS artista, al.titulo AS album, al.fecha_lanzamiento
FROM album al
JOIN artista a ON al.artista_id = a.id;

-- Vista: Listas de reproduccion compleja 
CREATE OR REPLACE VIEW vw_lista_canciones_compleja AS
SELECT 
  lr.nombre AS lista,
  u.nombre AS usuario,
  GROUP_CONCAT(c.titulo ORDER BY lrc.orden SEPARATOR ', ') AS canciones,
  (SELECT COUNT(*) FROM lista_reproduccion_cancion WHERE lista_reproduccion_id = lr.id) AS total_canciones
FROM lista_reproduccion lr
JOIN usuario u ON lr.usuario_id = u.id
JOIN lista_reproduccion_cancion lrc ON lr.id = lrc.lista_reproduccion_id
JOIN cancion c ON lrc.cancion_id = c.id
GROUP BY lr.id;

-- #################################################
-- Creacion de Funciones
-- #################################################

-- Funcion: Contar la cantidad de canciones en un album
DELIMITER $$
DROP FUNCTION IF EXISTS fn_contar_canciones_album $$
CREATE FUNCTION fn_contar_canciones_album (p_album_id BIGINT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE v_cantidad INT;
  SELECT COUNT(*) INTO v_cantidad FROM cancion WHERE album_id = p_album_id;
  RETURN v_cantidad;
END $$
DELIMITER ;

-- Funcion: Total de favoritos de un usuario
DELIMITER $$
DROP FUNCTION IF EXISTS fn_total_favoritos_usuario $$
CREATE FUNCTION fn_total_favoritos_usuario (p_usuario_id BIGINT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE v_total INT;
  SELECT ((SELECT COUNT(*) FROM favorito_cancion WHERE usuario_id = p_usuario_id) +
          (SELECT COUNT(*) FROM favorito_album WHERE usuario_id = p_usuario_id))
  INTO v_total;
  RETURN v_total;
END $$
DELIMITER ;

-- #################################################
-- Creacion de Stored Procedures
-- #################################################

-- Procedimiento: Insertar un comentario
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insertar_comentario $$
CREATE PROCEDURE sp_insertar_comentario(
  IN p_usuario_id BIGINT,
  IN p_cancion_id BIGINT,
  IN p_comentario VARCHAR(300)
)
BEGIN
  INSERT INTO comentario (usuario_id, cancion_id, comentario)
  VALUES (p_usuario_id, p_cancion_id, p_comentario);
END $$
DELIMITER ;

-- Procedimiento: Listar albumes de un artista
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_listar_albums_artista $$
CREATE PROCEDURE sp_listar_albums_artista(
  IN p_artista_id BIGINT
)
BEGIN
  SELECT * FROM album WHERE artista_id = p_artista_id;
END $$
DELIMITER ;

-- #################################################
-- Creacion de Triggers 
-- #################################################

-- Trigger: Antes de insertar un usuario, asignar 'Desconocido' si el pais es nulo o vacío
DELIMITER $$
DROP TRIGGER IF EXISTS tr_usuario_before_insert $$
CREATE TRIGGER tr_usuario_before_insert
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
  IF NEW.pais IS NULL OR NEW.pais = '' THEN
    SET NEW.pais = 'Desconocido';
  END IF;
END $$
DELIMITER ;

-- Trigger: Antes de insertar un comentario, verificar que tenga al menos 5 caracteres
DELIMITER $$
DROP TRIGGER IF EXISTS tr_comentario_before_insert $$
CREATE TRIGGER tr_comentario_before_insert
BEFORE INSERT ON comentario
FOR EACH ROW
BEGIN
  IF LENGTH(NEW.comentario) < 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El comentario debe tener al menos 5 caracteres';
  END IF;
END $$
DELIMITER ;


 