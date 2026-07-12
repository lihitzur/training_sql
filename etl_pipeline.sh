#!/bin/bash

DB=data/etl_project.db

echo "Creating stage tables..."
sqlite3 $DB < sql/01_stage_tables.sql

echo "Creating production tables..."
sqlite3 $DB < sql/02_transform_data.sql

echo "Creating report..."
sqlite3 -header -csv $DB < sql/03_analytical_query.sql > data/reporting/per_capita_energy_report.csv

echo "Done!"