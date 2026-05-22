#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto-config.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/19 17:36:46 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/22 16:36:53 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mkdir -p /run/php

cd /var/www/wordpress

while ! mysqladmin ping -h mariadb --silent; do
	sleep 2
done

if [ ! -f wp-config.php ]; then

	wp config create \
		--allow-root \
		--dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=mariadb:3306

	wp core install \
		--allow-root \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}

	wp user create \
		--allow-root \
		${WP_USER} ${WP_USER_EMAIL} \
		--user_pass=${WP_USER_PASSWORD}
fi

exec php-fpm8.2 -F