-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    city TEXT,
    country TEXT
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INT REFERENCES passengers NOT NULL,
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline_id INT REFERENCES airlines NOT NULL,
    from_airport_id INT REFERENCES airports NOT NULL,
    to_airport_id INT REFERENCES airports NOT NULL
);

INSERT INTO airlines (name)
VALUES 
    ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO airports (city, country)
VALUES 
    ('Washington DC', 'United States'),
    ('Seatle', 'United States'),
    ('Tokyo', 'Japan'),
    ('London', 'United Kingdom'),
    ('Los Angeles', 'United States'),
    ('Las Vegas', 'United States'),
    ('Mexico City', 'Mexico'),
    ('Paris', 'France'),
    ('Casablanca', 'Morocco'),
    ('Dubai', 'UAE'),
    ('Beijing', 'China'),
    ('New York', 'United States'),
    ('Charlotte', 'United States'),
    ('Cedar Rapids', 'United States'),
    ('Chicago', 'United States'),
    ('New Orleans', 'United States'),
    ('Sao Paolo', 'Brazil'),
    ('Santiago', 'Chile');

INSERT INTO passengers (first_name, last_name)
VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley'),
    ('Waneta', 'Skeleton'),
    ('Berkie', 'Wycliff'),
    ('Alvin', 'Leathes'),
    ('Cory', 'Squibbes');

INSERT INTO tickets 
(passenger_id, seat, airline_id, departure, from_airport_id, arrival, to_airport_id)
VALUES
    (1, '33B', 1, '2018-04-08 09:00:00', 1, '2018-04-08 12:00:00', 2),
    (2, '8A', 2, '2018-12-19 12:45:00', 3, '2018-12-19 16:15:00', 4),
    (3, '12F', 3, '2018-01-02 07:00:00', 5, '2018-01-02 08:03:00', 6),
    (1, '20A', 3, '2018-04-15 16:50:00', 2, '2018-04-15 21:00:00', 7),
    (4, '23D', 4, '2018-08-01 18:30:00', 8, '2018-08-01 21:50:00', 9),
    (2, '18C', 5, '2018-10-31 01:15:00', 10, '2018-10-31 12:55:00', 11),
    (5, '9E', 1, '2019-02-06 06:00:00', 12, '2019-02-06 07:47:00', 13),
    (6, '1A', 6, '2018-12-22 14:42:00', 14, '2018-12-22 15:56:00', 15),
    (5, '32B', 6, '2019-02-06 16:28:00', 13, '2019-02-06 19:18:00', 16),
    (7, '10D', 7, '2019-01-20 19:30:00', 17, '2019-01-20 22:45:00', 18);




-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');