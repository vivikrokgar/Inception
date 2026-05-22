# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/12 15:33:37 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/21 10:40:15 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y \
	&& apt install vim -y \
	&& apt-get install mariadb-server -y

COPY tools/mariadb.sh	/mariadb.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mariadb.sh


CMD ["bash", "/mariadb.sh"]