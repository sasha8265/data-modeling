-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE orbits_around (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INT REFERENCES orbits_around,
  galaxy_id INT REFERENCES galaxies,
  moon_id INT REFERENCES moons
);

CREATE TABLE planetary_systems (
    id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planets,
    orbits_around_id INT REFERENCES orbits_around,
    galaxy_id INT REFERENCES galaxies,
    moon_id INT REFERENCES moons
);

INSERT INTO galaxies (name)
VALUES 
    ('Milky Way');

INSERT INTO moons (name)
VALUES
    ('The Moon'),
    ('Phobos'),
    ('Deimos'),
    ('Naiad'),
    ('Thalassa'),
    ('Despina'),
    ('Galatea'),
    ('Larissa'),
    ('S/2004 N 1'),
    ('Proteus'),
    ('Triton'),
    ('Nereid'),
    ('Halimede'),
    ('Sao'),
    ('Laomedeia'),
    ('Psamathe'),
    ('Neso');
    
INSERT INTO orbits_around (name)
VALUES 
    ('The Sun'),
    ('Proxima Centauri'),
    ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);


INSERT INTO planetary_systems
  (planet_id, orbits_around_id, galaxy_id, moon_id)
VALUES
  (1, 1, 1, 1),
  (2, 1, 1, 2),
  (2, 1, 1, 3),
  (3, 1, 1, NULL),
  (4, 1, 1, 4),
  (4, 1, 1, 5),
  (4, 1, 1, 6),
  (4, 1, 1, 7),
  (4, 1, 1, 8),
  (4, 1, 1, 9),
  (4, 1, 1, 10),
  (4, 1, 1, 11),
  (4, 1, 1, 12),
  (4, 1, 1, 13),
  (4, 1, 1, 14),
  (4, 1, 1, 15),
  (4, 1, 1, 16),
  (4, 1, 1, 17),
  (5, 2, 1, NULL),
  (6, 3, 1, NULL);


SELECT planets.name, orbits_around.name, galaxies.name, moons.name  FROM planetary_systems
FULL JOIN planets
    ON planets.id = planetary_systems.planet_id
FULL JOIN orbits_around
    ON orbits_around.id = planetary_systems.orbits_around_id
FULL JOIN galaxies
    ON galaxies.id = planetary_systems.galaxy_id
FULL JOIN moons
    ON moons.id = planetary_systems.moon_id;
