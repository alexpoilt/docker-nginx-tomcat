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
apt-get install --no-install-recommends -y nginx && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -fr /etc/nginx/sites-available/default

COPY conf.d/ /etc/nginx/conf.d/

RUN ln -s /etc/nginx/sites-available/tomcat-proxy.conf /etc/nginx/sites-enabled/tomcat-proxy.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
