#!/bin/bash

CONTAINER_NAME="task3"
DB_NAME="company_db"
USER="ituser"
ADMIN_USER="admin_cee"
PASSWORD="securepassword"
DUMP_FILE="/company_db_dump.sql"
LOG_FILE="query_results.log"



echo "Creating database and admin user..."
docker exec -i $CONTAINER_NAME psql -U $USER -d postgres -c "CREATE DATABASE $DB_NAME;"
docker exec -i $CONTAINER_NAME psql -U $USER -d $DB_NAME -c "CREATE USER $ADMIN_USER WITH SUPERUSER PASSWORD '$PASSWORD';"

echo "Importing dataset..."
docker cp company_db_dump.sql $CONTAINER_NAME:$DUMP_FILE
docker exec -i $CONTAINER_NAME pg_restore -U $USER -d $DB_NAME -c < company_db_dump.sql

echo "Executing queries and saving results..."
docker exec -i $CONTAINER_NAME psql -U $USER -d $DB_NAME -c "
    -- Find total employees
    SELECT COUNT(*) AS total_employees FROM employees;
    
    -- Employees in a specific department (example: IT)
    SELECT first_name, last_name FROM employees 
    WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');
    
    -- Highest and lowest salaries per department
    SELECT d.department_name, 
           MAX(s.salary) AS highest_salary, 
           MIN(s.salary) AS lowest_salary
    FROM employees e
    JOIN salaries s ON e.employee_id = s.employee_id
    JOIN departments d ON e.department_id = d.department_id
    GROUP BY d.department_name;
" > $LOG_FILE


echo "All tasks completed successfully! Results saved in $LOG_FILE."

