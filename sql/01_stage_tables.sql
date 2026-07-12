DROP TABLE IF EXISTS stage_demographics;
DROP TABLE IF EXISTS stage_energy;

CREATE TABLE stage_demographics (
    iso_code TEXT,
    location TEXT,
    population TEXT,
    population_density TEXT
);


CREATE TABLE stage_energy (
    iso_code TEXT,
    year TEXT,
    electricity_generation TEXT,
    renewables_electricity TEXT
);