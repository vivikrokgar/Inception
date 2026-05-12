# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvalenti <vvalenti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/12 15:33:40 by vvalenti          #+#    #+#              #
#    Updated: 2026/05/12 16:12:30 by vvalenti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update && apt install -y nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt install OpenSSL -y

CMD ["nginx", "-g", "daemon off;"]
