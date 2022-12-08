CREATE DATABASE ${new_db_name};
CREATE USER ${new_db_user} WITH ENCRYPTED PASSWORD '${new_db_password}';
GRANT ALL PRIVILEGES ON DATABASE jumia_phone_validator TO jumia;