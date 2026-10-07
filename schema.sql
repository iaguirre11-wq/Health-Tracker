CREATE TABLE IF NOT EXISTS foods (
    food_id            INTEGER PRIMARY KEY,
    name               TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    calories_per_100g  REAL    NOT NULL CHECK (calories_per_100g >= 0),
    protein_per_100g   REAL    NOT NULL CHECK (protein_per_100g >= 0),
    fat_per_100g       REAL    NOT NULL CHECK (fat_per_100g >= 0),
    carbs_per_100g     REAL    NOT NULL CHECK (carbs_per_100g >= 0)
) STRICT;

CREATE TABLE IF NOT EXISTS habits (
    habit_id            INTEGER PRIMARY KEY,
    name                TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    current_streak        INTEGER NOT NULL DEFAULT 0 CHECK (current_streak >= 0)
) STRICT;

CREATE TABLE IF NOT EXISTS exercises (
    exercise_id        INTEGER PRIMARY KEY,
    name               TEXT    NOT NULL UNIQUE COLLATE NOCASE
) STRICT;