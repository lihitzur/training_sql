DROP TABLE IF EXISTS prod_demographics;
DROP TABLE IF EXISTS prod_energy;

CREATE TABLE prod_demographics AS
SELECT
    iso_code,
    location,
    CAST(population AS REAL) AS population,
    CAST(population_density AS REAL) AS population_density
FROM stage_demographics
WHERE LENGTH(iso_code) = 3;

CREATE TABLE prod_energy AS
SELECT
    iso_code,
    year,
    CAST(electricity_generation AS REAL) AS electricity_generation,
    CAST(renewables_electricity AS REAL) AS renewables_electricity
FROM stage_energy
WHERE LENGTH(iso_code) = 3
  AND year IN ('2022', '2023');
