DROP TABLE IF EXISTS per_capita_energy_report;

CREATE TABLE per_capita_energy_report AS
SELECT
    d.iso_code,
    d.location,
    e.year,
    e.electricity_generation,
    d.population,
    e.electricity_generation / d.population AS per_capita_electricity_generation
FROM prod_demographics d
INNER JOIN prod_energy e
ON d.iso_code = e.iso_code
ORDER BY per_capita_electricity_generation DESC;