#!/bin/bash

sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service

# sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password@321';"
# Run MySQL Secure Installation
# sudo mysql_secure_installation <<EOF
# Password@321
# n
# n
# y
# y
# y
# y
# EOF
# Change authentication method to auth_socket
# sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;"

# sudo mysql
# port: 3306