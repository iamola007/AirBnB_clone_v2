--script that prepares a MySQL server for the AirBnB project.
# MySQL root user credentials
MYSQL_ROOT_USER="purple_quasar"
MYSQL_ROOT_PASSWORD="Drag0n!Hyd3."

# MySQL database and user information
DB_NAME="hbnb_dev_db"
DB_USER="hbnb_dev"
DB_PASSWORD="hbnb_dev_pwd"

# Create the database if it doesn't exist
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Create the user if it doesn't exist
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"

# Grant privileges to the user for the hbnb_dev_db database
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"

# Grant SELECT privilege to the user for the performance_schema database
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "GRANT SELECT ON performance_schema.* TO '$DB_USER'@'localhost';"

# Flush privileges to apply changes
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

echo "MySQL server setup complete."
