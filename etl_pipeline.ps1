$db = "data/etl_project.db"

Write-Host "Creating stage tables..."
sqlite3 $db ".read sql/01_stage_tables.sql"

Write-Host "Creating production tables..."
sqlite3 $db ".read sql/02_transform_data.sql"

Write-Host "Creating report..."

sqlite3 -header -csv $db ".read sql/03_analytical_query.sql" `
> data/reporting/per_capita_energy_report.csv

Write-Host "ETL pipeline completed!"