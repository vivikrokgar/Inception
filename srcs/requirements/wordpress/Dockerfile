# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/12 15:33:42 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/28 15:49:44 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt-get update && apt install -y \
	vim \
	php \
	php-fpm \
	php-mysql\
	mariadb-client \
	wget

RUN wget https://fr.wordpress.org/wordpress-6.9-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.9-fr_FR.tar.gz && rm wordpress-6.9-fr_FR.tar.gz
	
RUN chown -R www-data:www-data /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/auto-config.sh /auto-config.sh

RUN chmod +x /auto-config.sh

CMD ["bash", "/auto-config.sh"]