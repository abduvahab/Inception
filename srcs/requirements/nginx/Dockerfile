FROM debian:buster

#Install nginx with RUN
RUN apt-get update && apt-get -y install nginx \
openssl \
&& rm -rf /var/lib/apt/lists/*

#Generate a self certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/areheman.42.fr.pem \
	-keyout /etc/ssl/areheman.42.fr.key \
	-subj "/C=FR/ST=Mulhouse/L=Mulhouse/O=42 School/OU=areheman/CN=areheman.42.fr"

#Copy the new configuration inside nginx
COPY conf/nginx.conf /etc/nginx/conf.d
COPY tools/start.sh /start.sh

EXPOSE 443

CMD ["bash", "/start.sh"]