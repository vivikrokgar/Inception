# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/12 15:33:40 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/19 15:36:40 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update && apt install -y nginx \
	&& apt install vim -y \
	&& apt install openssl -y 

RUN mkdir -p /etc/nginx/ssl

RUN openssl	req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
 -keyout /etc/nginx/ssl/inception.key \
 -subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=vvalenti.42.fr/UID=vvalenti"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html


CMD ["nginx", "-g", "daemon off;"]
