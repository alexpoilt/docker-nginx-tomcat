FROM debian:stretch

LABEL maintainer="PERICLES JR <pericles.scj@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV CONTRIB_MIRROR=debian.pop-sc.rnp.br
ENV SECURITY_MIRROR=security.debian.org
ENV HTTP_PORT=7070
ENV FQDN=localhost
ENV APP_PATH=sample

RUN echo "deb http://${CONTRIB_MIRROR}/debian/ stretch main contrib non-free" > /etc/apt/sources.list && \
echo "deb http://${SECURITY_MIRROR}/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install --no-install-recommends -y nginx openssl && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

COPY vhosts/ /etc/nginx/sites-available/

COPY ssl/ /etc/nginx/ssl/

COPY entrypoint.sh /usr/local/sbin/

RUN openssl req -new -x509 -days 365 \
-nodes -out /etc/nginx/ssl/cert.pem \
-keyout /etc/nginx/ssl/key.pem \
-subj "/C=BR/ST=Bahia/L=Salvador/O=Test/OU=Dev/CN=localhost"

RUN chmod +x /usr/local/sbin/entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
