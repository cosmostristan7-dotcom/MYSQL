--1. Create a DATABASE named GAMERlog. --
CREATE DATABASE IF NOT EXISTS GAMERlog;

USE GAMERlog;

--2. Create a TABLE named Games with the following columns: --
CREATE TABLE IF NOT EXISTS Games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_title VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--3. Create a TABLE named Users with the following columns: --
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--4. Create a TABLE named Progress with the following columns: --
CREATE TABLE IF NOT EXISTS Progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    level INT NOT NULL,
    score INT NOT NULL, -- Moved from Games
    play_time DATETIME NOT NULL, -- Moved from Games
    achievements VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (game_id) REFERENCES Games (id)
);

-- ==========================================
-- INSERTING SAMPLE DATA TO TEST IT ALL
-- ==========================================

-- 1. Insert Sample Users (Stays the same)
INSERT INTO
    Users (
        username,
        email,
        password_hash
    )
VALUES (
        'gamer1',
        'gamer1@example.com',
        'hashed_password_1'
    ),
    (
        'gamer2',
        'gamer2@example.com',
        'hashed_password_2'
    );

-- 2. Insert Sample Games (Clean & global catalog entries)
INSERT INTO
    Games (game_title)
VALUES ('Game A'),
    ('Game B');

-- 3. Insert Sample Progress (Where the magic and player stats happen)
INSERT INTO
    Progress (
        user_id,
        game_id,
        level,
        score,
        play_time,
        achievements
    )
VALUES (
        1,
        1,
        5,
        1500,
        '2024-06-01 14:30:00',
        'First Blood'
    ),
    (
        2,
        2,
        10,
        2000,
        '2024-06-02 16:45:00',
        'Sharp Shooter'
    );

-- ==========================================
-- THE ULTIMATE TEST: Querying the Data
-- ==========================================
-- This is where the INNER JOINs actually belong!
-- We can use INNER JOINs to combine data from the Users, Games, and Progress tables to get a comprehensive view of user activity.
SELECT *
FROM
    Users u
    INNER JOIN Progress p ON u.user_id = p.user_id
    INNER JOIN Games g ON p.game_id = g.id;