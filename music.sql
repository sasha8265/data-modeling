-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE releases (
    id SERIAL PRIMARY KEY,
    song_id INT REFERENCES songs,
    artist_id INT REFERENCES artists,
    album_id INT REFERENCES albums,
    producer_id INT REFERENCES producers
);


INSERT INTO artists (name)
VALUES
    ('Hansen'),
    ('Queen'),
    ('Mariah Cary'),
    ('Boyz II Men'),
    ('Lady Gaga'),
    ('Bradley Cooper'),
    ('Nickelback'),
    ('Jay Z'),
    ('Alicia Keys'),
    ('Katy Perry'),
    ('Juicy J'),
    ('Maroon 5'),
    ('Christina Aguilera'),
    ('Avril Lavigne'),
    ('Destiny''s Child');

INSERT INTO albums (name)
VALUES
    ('Middle of Nowhere'),
    ('A Night at the Opera'),
    ('Daydream'),
    ('A Star Is Born'),
    ('Silver Side Up'),
    ('The Blueprint 3'),
    ('Prism'),
    ('Hands All Over'),
    ('Let Go'),
    ('The Writing''s on the Wall');

INSERT INTO producers (name)
VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Walter Afanasieff'),
    ('Benjamin Rice'),
    ('Rick Parashar'),
    ('Al Shux'),
    ('Max Martin'),
    ('Cirkut'),
    ('Shellback'),
    ('Benny Blanco'),
    ('The Matrix'),
    ('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date)
VALUES
    ('MMMBop', 238, '1997-04-15'),
    ('Bohemian Rhapsody', 355, '1975-10-31'),
    ('One Sweet Day', 282, '1995-11-14'),
    ('Shallow', 216, '2018-09-27'),
    ('How You Remind Me', 223, '2001-08-21'),
    ('New York State of Mind', 276, '2009-10-20'),
    ('Dark Horse', 215, '2013-12-17'),
    ('Moves Like Jagger', 201, '2011-06-21'),
    ('Complicated', 244, '2002-05-14'),
    ('Say My Name', 240, '1999-11-07');

INSERT INTO releases (song_id, artist_id, album_id, producer_id)
VALUES
    (1, 1, 1, 1),
    (1, 1, 1, 2),
    (2, 2, 2, 3),
    (3, 3, 3, 4),
    (3, 4, 3, 4),
    (4, 5, 4, 5),
    (4, 6, 4, 5),
    (5, 7, 5, 6),
    (6, 8, 6, 7),
    (6, 9, 6, 7),
    (7, 10, 7, 8),
    (7, 11, 7, 8),
    (7, 10, 7, 9),
    (7, 11, 7, 9),
    (8, 12, 8, 10),
    (8, 13, 8, 10),
    (8, 12, 8, 11),
    (8, 13, 8, 11),
    (9, 14, 9, 12),
    (10, 15, 10, 13);





-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
