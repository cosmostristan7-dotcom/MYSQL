--1. Create a DATABASE to store an Aquarium animals information.
CREATE DATABASE IF NOT EXISTS aquarium_db;

--2. Create a TABLE to store the information of Aquarium animals.
CREATE TABLE IF NOT EXISTS aquarium_db.animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    habitat VARCHAR(100) NOT NULL,
    diet VARCHAR(100) NOT NULL,
    tank_id INT NOT NULL,
    feed_frequency_day INT NOT NULL,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--3. Create a TABLE to save the information of tanks in the Aquarium.
CREATE TABLE IF NOT EXISTS aquarium_db.tanks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    water_type VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL,
    capacity_galoons INT NOT NULL,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Insert sample data into the animals table.
INSERT INTO
    aquarium_db.animals (
        name,
        species,
        age,
        habitat,
        diet,
        tank_id,
        feed_frequency_day
    )
VALUES (
        'Nemo',
        'Clownfish',
        2,
        'Coral Reef',
        'Omnivore',
        1,
        2
    ),
    (
        'Dory',
        'Blue Tang',
        3,
        'Coral Reef',
        'Herbivore',
        1,
        1
    ),
    (
        'Bubbles',
        'Yellow Tang',
        4,
        'Coral Reef',
        'Herbivore',
        1,
        1
    ),
    (
        'Jaws',
        'Great White Shark',
        5,
        'Open Ocean',
        'Carnivore',
        2,
        3
    ),
    (
        'Flipper',
        'Dolphin',
        6,
        'Open Ocean',
        'Carnivore',
        2,
        2
    ),
    (
        'Shelly',
        'Sea Turtle',
        10,
        'Seagrass Beds',
        'Herbivore',
        3,
        1
    ),
    (
        'Spike',
        'Porcupinefish',
        2,
        'Coral Reef',
        'Omnivore',
        1,
        2
    ),
    (
        'Moby',
        'Blue Whale',
        25,
        'Open Ocean',
        'Carnivore',
        2,
        1
    ),
    (
        'Squirt',
        'Sea Turtle',
        8,
        'Seagrass Beds',
        'Herbivore',
        3,
        1
    ),
    (
        'Gill',
        'Moorish Idol',
        3,
        'Coral Reef',
        'Omnivore',
        1,
        2
    );

-- 5. Insert sample data into the tanks table.
INSERT INTO
    aquarium_db.tanks (
        name,
        capacity,
        water_type,
        location,
        capacity_galoons
    )
VALUES (
        'Coral Reef Tank',
        500,
        'Saltwater',
        'Building A',
        132
    ),
    (
        'Open Ocean Tank',
        1000,
        'Saltwater',
        'Building B',
        264
    ),
    (
        'Seagrass Beds Tank',
        300,
        'Saltwater',
        'Building C',
        79
    );

---- ---- --- ---- ---- --- ---- --- ---- -- ---- --- ---- --- --
---- ---- --- ---- ---- --- ---- --- ---- -- ---- --- ---- --- --

----------------------- MY QUERY EXERCISES ----------------------

-- EXECISE 1: List of all animals (name and species) that need to be fed more than 3 times a day. --
SELECT name, species
FROM aquarium_db.animals
WHERE
    feed_frequency_day > 3;

-- EXERCISE 2: Show total number of animals  by their tanks,living in tank_id 1. --
SELECT COUNT(*) AS total_animals
FROM aquarium_db.animals
GROUP BY
    tank_id

-- EXERCISE 3: List of all animals living in tanks with saltwater, sweetwater, and brackish water. Show also their tank names. --
SELECT a.name, a.species, t.name AS tank_name
FROM aquarium_db.animals a
    JOIN aquarium_db.tanks t ON a.tank_id = t.id
WHERE
    t.water_type IN (
        'Saltwater',
        'Sweetwater',
        'Brackish'
    );