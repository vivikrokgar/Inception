#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/19 16:30:18 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/20 16:51:25 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


set -e

mysqld_safe &

while ! mysqladmin ping --silent; do
	sleep 1
done

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then

	echo "Creating database..."
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

	echo "Creating user..."
	mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	echo "Granting privileges..."
	mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"

	echo "Setting root password..."
	mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

	echo "Flushing privileges..."
	mariadb -e "FLUSH PRIVILEGES;"

	echo "MariaDB initialization done!"

else
	echo "Database already exists"
fi


wait