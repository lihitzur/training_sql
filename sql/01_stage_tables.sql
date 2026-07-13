
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


INSERT INTO stage_demographics (
    iso_code,
    location,
    population,
    population_density
)
SELECT
    iso_code,
    location,
    population,
    population_density
FROM raw_demographics
WHERE iso_code IS NOT NULL
AND iso_code != ''
AND location IS NOT NULL
AND population IS NOT NULL
AND population_density IS NOT NULL;


INSERT INTO stage_energy (
    iso_code,
    year,
    electricity_generation,
    renewables_electricity
)
SELECT
    iso_code,
    year,
    electricity_generation,
    renewables_electricity
FROM raw_energy
WHERE iso_code IS NOT NULL
AND iso_code != ''
AND year IS NOT NULL
AND electricity_generation IS NOT NULL
AND renewables_electricity IS NOT NULL;