-- #################################################
-- Inserción de Datos (10 registros por tabla)
-- #################################################

-- Tabla: genero
INSERT INTO genero (id, nombre) VALUES 
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz'),
(4, 'Classical'),
(5, 'Hip-Hop'),
(6, 'Electronic'),
(7, 'Reggae'),
(8, 'Country'),
(9, 'Blues'),
(10, 'Metal');

-- Tabla: usuario
INSERT INTO usuario (id, nombre, email, pais) VALUES
(1, 'Ana Perez', 'ana.perez@example.com', 'Argentina'),
(2, 'Luis Gomez', 'luis.gomez@example.com', 'Chile'),
(3, 'María Lopez', 'maria.lopez@example.com', 'Colombia'),
(4, 'Juan Torres', 'juan.torres@example.com', 'Peru'),
(5, 'Carlos Diaz', 'carlos.diaz@example.com', 'Mexico'),
(6, 'Sofía Ruiz', 'sofia.ruiz@example.com', 'España'),
(7, 'Diego Martinez', 'diego.martinez@example.com', 'Argentina'),
(8, 'Laura Sanchez', 'laura.sanchez@example.com', 'Brasil'),
(9, 'Miguel Castro', 'miguel.castro@example.com', 'Uruguay'),
(10, 'Elena Morales', 'elena.morales@example.com', 'Venezuela');

-- Tabla: artista
INSERT INTO artista (id, nombre, genero_id) VALUES
(1, 'The Rockers', 1),
(2, 'Pop Stars', 2),
(3, 'Jazz Band', 3),
(4, 'Classical Quartet', 4),
(5, 'HipHop Crew', 5),
(6, 'Electronic Duo', 6),
(7, 'Reggae Roots', 7),
(8, 'Country Roads', 8),
(9, 'Blues Brothers', 9),
(10, 'Metal Heads', 10);

-- Tabla: album
INSERT INTO album (id, titulo, artista_id, fecha_lanzamiento) VALUES
(1, 'Rocking Out', 1, '2020-01-15'),
(2, 'Pop Explosion', 2, '2020-03-20'),
(3, 'Smooth Jazz', 3, '2019-07-10'),
(4, 'Classical Moods', 4, '2018-05-05'),
(5, 'HipHop Beats', 5, '2021-09-01'),
(6, 'Electric Vibes', 6, '2022-02-14'),
(7, 'Reggae Sunshine', 7, '2021-11-11'),
(8, 'Country Classics', 8, '2017-08-08'),
(9, 'Blues in the Night', 9, '2020-10-10'),
(10, 'Metal Mayhem', 10, '2021-12-31');

-- Tabla: cancion
INSERT INTO cancion (id, titulo, duracion, album_id) VALUES
(1, 'Song A', '00:03:30', 1),
(2, 'Song B', '00:04:00', 2),
(3, 'Song C', '00:02:45', 3),
(4, 'Song D', '00:05:15', 4),
(5, 'Song E', '00:03:50', 5),
(6, 'Song F', '00:04:10', 6),
(7, 'Song G', '00:03:20', 7),
(8, 'Song H', '00:04:30', 8),
(9, 'Song I', '00:03:40', 9),
(10, 'Song J', '00:05:00', 10);

-- Tabla: lista_reproduccion
INSERT INTO lista_reproduccion (id, nombre, usuario_id) VALUES
(1, 'Favorites', 1),
(2, 'Morning Mix', 2),
(3, 'Workout', 3),
(4, 'Chill', 4),
(5, 'Party', 5),
(6, 'Relax', 6),
(7, 'Hits', 7),
(8, 'Classics', 8),
(9, 'New Releases', 9),
(10, 'Top 10', 10);

-- Tabla: historial_reproduccion
INSERT INTO historial_reproduccion (usuario_id, cancion_id, fecha_reproduccion) VALUES
(1, 1, '2022-10-01 10:00:00'),
(2, 2, '2022-10-02 11:00:00'),
(3, 3, '2022-10-03 12:00:00'),
(4, 4, '2022-10-04 13:00:00'),
(5, 5, '2022-10-05 14:00:00'),
(6, 6, '2022-10-06 15:00:00'),
(7, 7, '2022-10-07 16:00:00'),
(8, 8, '2022-10-08 17:00:00'),
(9, 9, '2022-10-09 18:00:00'),
(10, 10, '2022-10-10 19:00:00');

-- Tabla: suscripcion
INSERT INTO suscripcion (usuario_id, tipo, fecha_inicio, fecha_fin) VALUES
(1, 'Premium', '2022-01-01', '2023-01-01'),
(2, 'Free', '2022-02-01', NULL),
(3, 'Premium', '2022-03-01', '2023-03-01'),
(4, 'Premium', '2022-04-01', '2023-04-01'),
(5, 'Free', '2022-05-01', NULL),
(6, 'Premium', '2022-06-01', '2023-06-01'),
(7, 'Free', '2022-07-01', NULL),
(8, 'Premium', '2022-08-01', '2023-08-01'),
(9, 'Premium', '2022-09-01', '2023-09-01'),
(10, 'Free', '2022-10-01', NULL);

-- Tabla: comentario
INSERT INTO comentario (usuario_id, cancion_id, comentario, fecha) VALUES
(1, 1, 'Great song!', '2022-10-01 10:05:00'),
(2, 2, 'Love this track!', '2022-10-02 11:05:00'),
(3, 3, 'Amazing rhythm.', '2022-10-03 12:05:00'),
(4, 4, 'Not my style.', '2022-10-04 13:05:00'),
(5, 5, 'Could be better.', '2022-10-05 14:05:00'),
(6, 6, 'Fantastic beat!', '2022-10-06 15:05:00'),
(7, 7, 'Very catchy.', '2022-10-07 16:05:00'),
(8, 8, 'Enjoyable track.', '2022-10-08 17:05:00'),
(9, 9, 'Superb vocals!', '2022-10-09 18:05:00'),
(10, 10, 'Rocking tune!', '2022-10-10 19:05:00');

-- Tabla: colaboracion
INSERT INTO colaboracion (artista_principal_id, artista_colaborador_id, cancion_id) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 5),
(6, 7, 6),
(7, 8, 7),
(8, 9, 8),
(9, 10, 9),
(10, 1, 10);

-- Tabla: evento
INSERT INTO evento (artista_id, nombre, fecha, lugar) VALUES
(1, 'Concert A', '2022-12-01 20:00:00', 'Stadium 1'),
(2, 'Concert B', '2022-12-05 21:00:00', 'Stadium 2'),
(3, 'Live Show', '2022-12-10 19:00:00', 'Arena 1'),
(4, 'Festival', '2022-12-15 18:00:00', 'Park 1'),
(5, 'Gala Night', '2022-12-20 22:00:00', 'Hall 1'),
(6, 'Music Fest', '2022-12-25 20:00:00', 'Stadium 3'),
(7, 'Evening Jam', '2022-12-30 19:00:00', 'Club 1'),
(8, 'Rock Night', '2023-01-05 20:00:00', 'Arena 2'),
(9, 'Pop Extravaganza', '2023-01-10 21:00:00', 'Theater 1'),
(10, 'Jazz Evening', '2023-01-15 19:00:00', 'Club 2');

-- Tabla: lista_reproduccion_cancion
INSERT INTO lista_reproduccion_cancion (lista_reproduccion_id, cancion_id, orden) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- Tabla: favorito_cancion
INSERT INTO favorito_cancion (usuario_id, cancion_id, fecha_agregado) VALUES
(1, 1, '2022-11-01 10:00:00'),
(2, 2, '2022-11-02 11:00:00'),
(3, 3, '2022-11-03 12:00:00'),
(4, 4, '2022-11-04 13:00:00'),
(5, 5, '2022-11-05 14:00:00'),
(6, 6, '2022-11-06 15:00:00'),
(7, 7, '2022-11-07 16:00:00'),
(8, 8, '2022-11-08 17:00:00'),
(9, 9, '2022-11-09 18:00:00'),
(10, 10, '2022-11-10 19:00:00');

-- Tabla: favorito_album
INSERT INTO favorito_album (usuario_id, album_id, fecha_agregado) VALUES
(1, 1, '2022-11-11 10:00:00'),
(2, 2, '2022-11-12 11:00:00'),
(3, 3, '2022-11-13 12:00:00'),
(4, 4, '2022-11-14 13:00:00'),
(5, 5, '2022-11-15 14:00:00'),
(6, 6, '2022-11-16 15:00:00'),
(7, 7, '2022-11-17 16:00:00'),
(8, 8, '2022-11-18 17:00:00'),
(9, 9, '2022-11-19 18:00:00'),
(10, 10, '2022-11-20 19:00:00');
