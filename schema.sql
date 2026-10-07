CREATE TABLE IF NOT EXISTS foods (
    food_id            INTEGER PRIMARY KEY,
    name               TEXT    NOT NULL UNIQUE,
    calories_per_100g  REAL    NOT NULL CHECK (calories_per_100g >= 0),
    protein_per_100g   REAL    NOT NULL CHECK (protein_per_100g >= 0),
    fat_per_100g       REAL    NOT NULL CHECK (fat_per_100g >= 0),
    carbs_per_100g     REAL    NOT NULL CHECK (carbs_per_100g >= 0)
) STRICT;