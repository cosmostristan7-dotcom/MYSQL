--1. Create a DATABASE to store the user's Fitness Tracking data.
CREATE DATABASE FitnessTracking;

USE FitnessTracking;

--2. Create a TABLE to store the user's personal information.
CREATE TABLE PersonalInfo (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

--3. Create a TABLE to store the user's workout routines. (One-to-Many with Users)
CREATE TABLE WorkoutRoutines (
    WorkoutRoutineID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    RoutineName VARCHAR(100) NOT NULL,
    Duration INT NOT NULL, -- Duration in minutes
    Workout_date DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES PersonalInfo (UserID)
);

--4. Create a TABLE to stores  the user's exercise logs. (One-to-Many with Users)
CREATE TABLE ExerciseLogs (
    ExerciseLogID INT PRIMARY KEY AUTO_INCREMENT,
    ExerciseName VARCHAR(100) NOT NULL,
    Sets INT NOT NULL,
    Reps INT NOT NULL,
    Weight DECIMAL(5, 2), -- Weight in kilograms
    LogDate DATE NOT NULL
);

--5. THE MISSING PIECE: The Junction Table (Many-to-Many Bridge)
-- This table links user_workout_routines and exercise_logs together.
CREATE TABLE RoutineExerciseBridge (
    WorkoutRoutineID INT NOT NULL,
    ExerciseLogID INT NOT NULL,
    PRIMARY KEY (
        WorkoutRoutineID,
        ExerciseLogID
    ), -- Prevents duplicating the exact same exercise in the same routine
    FOREIGN KEY (WorkoutRoutineID) REFERENCES WorkoutRoutines (WorkoutRoutineID) ON DELETE CASCADE,
    FOREIGN KEY (ExerciseLogID) REFERENCES ExerciseLogs (ExerciseLogID) ON DELETE CASCADE
);

-- ==========================================
-- INSERTING SAMPLE DATA TO TEST IT ALL
-- ==========================================

-- Insert Sample Users
INSERT INTO
    PersonalInfo (
        FirstName,
        LastName,
        DateOfBirth,
        Email
    )
VALUES (
        'John',
        'Doe',
        '1990-01-01',
        'john.doe@example.com'
    );

--Insert Sample Workout Routines (Linked to UserID)
INSERT INTO
    WorkoutRoutines (
        UserID,
        RoutineName,
        Duration,
        Workout_date
    )
VALUES (
        1,
        'Full Body Workout',
        60,
        '2024-06-01'
    );

--Insert Sample Exercise Logs (Linked to UserID)
INSERT INTO
    ExerciseLogs (
        ExerciseName,
        Sets,
        Reps,
        Weight,
        LogDate
    )
VALUES (
        'Bench Press',
        4,
        10,
        80.00,
        '2024-06-01'
    );

--Insert Sample RoutineExerciseBridge (Linking WorkoutRoutineID and ExerciseLogID)
INSERT INTO
    RoutineExerciseBridge (
        WorkoutRoutineID,
        ExerciseLogID
    )
VALUES (1, 1);

-- ==========================================
-- THE ULTIMATE TEST: Querying the Data
-- ==========================================
-- This is where the INNER JOINs actually belong!
-- We start at WorkoutRoutines, hop to PersonalInfo, hop to the bridge, and end at ExerciseLogs.
SELECT *
FROM
    WorkoutRoutines wr
    INNER JOIN PersonalInfo pi ON wr.UserID = pi.UserID
    INNER JOIN RoutineExerciseBridge reb ON wr.WorkoutRoutineID = reb.WorkoutRoutineID
    INNER JOIN ExerciseLogs el ON reb.ExerciseLogID = el.ExerciseLogID;