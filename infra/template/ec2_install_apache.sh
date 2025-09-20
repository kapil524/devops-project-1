#!/bin/bash
set -e

# Update system and install dependencies
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip git

# Clone Python project
cd /home/ubuntu
git clone https://github.com/rahulwagh/python-mysql-db-proj-1.git
cd python-mysql-db-proj-1

# Install Python requirements
pip3 install -r requirements.txt

# Inject RDS connection details into app.py (or config file)
RDS_ENDPOINT="${rds_endpoint}"
DB_USER="${db_user}"
DB_PASS="${db_password}"
DB_NAME="${db_name}"

# Replace placeholders in app.py (adjust if project uses config.py instead)
sed -i "s/localhost/$RDS_ENDPOINT/g" app.py
sed -i "s/dbuser/$DB_USER/g" app.py
sed -i "s/dbpassword/$DB_PASS/g" app.py
sed -i "s/devprojdb/$DB_NAME/g" app.py

# Run the Python app
echo "Starting Python app..."
nohup python3 -u app.py > /home/ubuntu/app.log 2>&1 &
