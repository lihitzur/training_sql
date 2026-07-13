
New-Item -ItemType Directory -Force data\raw
curl "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/latest/owid-covid-latest.csv" -o data/raw/demographics.csv
curl "https://raw.githubusercontent.com/owid/energy-data/master/owid-energy-data.csv" -o data/raw/energy.csv

sqlite3 data\etl_project.db ".read sql/00_raw_tables.sql"
sqlite3 data\etl_project.db ".mode csv" ".import data/raw/demographics.csv raw_demographics"
sqlite3 data\etl_project.db ".mode csv" ".import data/raw/energy.csv raw_energy"

sqlite3 data\etl_project.db ".tables"


sqlite3 data\etl_project.db ".read sql/01_stage_tables.sql"


sqlite3 data\etl_project.db "SELECT * FROM stage_demographics LIMIT 5;"
sqlite3 data\etl_project.db "SELECT * FROM stage_energy LIMIT 5;"

sqlite3 data\etl_project.db ".read sql/02_transform_data.sql"

sqlite3 data\etl_project.db "SELECT * FROM prod_demographics LIMIT 5;"
sqlite3 data\etl_project.db "SELECT * FROM prod_energy LIMIT 5;"

sqlite3 data\etl_project.db ".read sql/03_analytical_query.sql"
sqlite3 data\etl_project.db "SELECT * FROM per_capita_energy_report;"