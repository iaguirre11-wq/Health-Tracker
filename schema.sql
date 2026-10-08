CREATE TABLE IF NOT EXISTS foods (
    food_id            INTEGER PRIMARY KEY,
    external_id        TEXT,
    source             TEXT    DEFAULT 'manual' NOT NULL CHECK (source in ('manual', 'usda', 'openfoodfacts')),
    barcode            TEXT    UNIQUE,
    name               TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    calories_per_100g  REAL    NOT NULL CHECK (calories_per_100g >= 0),
    protein_per_100g   REAL    NOT NULL CHECK (protein_per_100g >= 0),
    fat_per_100g       REAL    NOT NULL CHECK (fat_per_100g >= 0),
    carbs_per_100g     REAL    NOT NULL CHECK (carbs_per_100g >= 0),
    CHECK ((source = 'manual' AND external_id IS NULL) OR (source != 'manual' AND external_id IS NOT NULL)),
    UNIQUE (source, external_id)
) STRICT;

CREATE TABLE IF NOT EXISTS habits (
    habit_id            INTEGER PRIMARY KEY,
    name                TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    current_streak      INTEGER NOT NULL DEFAULT 0 CHECK (current_streak >= 0)
) STRICT;

CREATE TABLE IF NOT EXISTS exercises (
    exercise_id        INTEGER PRIMARY KEY,
    name               TEXT    NOT NULL UNIQUE COLLATE NOCASE
) STRICT;

CREATE TABLE IF NOT EXISTS food_logs (
    log_id            INTEGER PRIMARY KEY,
    food_id           INTEGER NOT NULL REFERENCES foods(food_id) ON DELETE RESTRICT,
    amount_grams      REAL    NOT NULL CHECK (amount_grams > 0),
    log_date          TEXT    NOT NULL CHECK (log_date IS date(log_date))
) STRICT;

CREATE TABLE IF NOT EXISTS exercise_logs (
    log_id            INTEGER PRIMARY KEY,
    exercise_id       INTEGER NOT NULL REFERENCES exercises(exercise_id) ON DELETE RESTRICT,
    number_sets       INTEGER NOT NULL CHECK (number_sets > 0),
    number_reps       INTEGER NOT NULL CHECK (number_reps > 0),
    log_date          TEXT    NOT NULL CHECK (log_date IS date(log_date))
) STRICT;

CREATE TABLE IF NOT EXISTS habit_logs (
    log_id            INTEGER PRIMARY KEY,
    habit_id          INTEGER NOT NULL REFERENCES habits(habit_id) ON DELETE RESTRICT,
    completed         INTEGER NOT NULL DEFAULT 0 CHECK (completed IN (0, 1)),
    log_date          TEXT    NOT NULL CHECK (log_date IS date(log_date)),
    UNIQUE (habit_id, log_date)
) STRICT;

CREATE TABLE IF NOT EXISTS water_logs (
    log_id            INTEGER PRIMARY KEY,
    amount_ounces     REAL    NOT NULL CHECK (amount_ounces > 0),
    log_date          TEXT    NOT NULL CHECK (log_date IS date(log_date))
) STRICT;

CREATE TABLE IF NOT EXISTS body_stats (
    log_id            INTEGER PRIMARY KEY,
    weight_lbs        REAL    NOT NULL CHECK (weight_lbs > 0),
    body_fat_percent  REAL    NOT NULL CHECK (body_fat_percent > 0 AND body_fat_percent < 100),
    log_date          TEXT    NOT NULL CHECK (log_date IS date(log_date))
) STRICT;
