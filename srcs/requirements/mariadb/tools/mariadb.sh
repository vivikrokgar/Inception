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

mkdir -p /run/mysql
chown -R mysql:mysql /run/mysql

mysqld_safe --datadir=/var/lib/mysql &

while ! mysqladmin ping --silent; do
	sleep 1
done

echo "Creating database..."

mariadb -u root << EOF

CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;

CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';

GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;

EOF

echo "Starting mysqld_safe..."

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe --datadir=/var/lib/mysql