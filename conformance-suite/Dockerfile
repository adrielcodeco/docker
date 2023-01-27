FROM maven:3-jdk-11 AS builder

WORKDIR /usr/src/conformance-suite

RUN git clone https://gitlab.com/openid/conformance-suite.git .

RUN mvn -B clean package

FROM openjdk:11-jdk-slim

WORKDIR /usr/src/conformance-suite

RUN apt-get update
RUN apt-get install -y \
        redir \
        apache2 \
        ssl-cert
RUN apt-get clean

COPY --from=builder /usr/src/conformance-suite/target  /server
COPY suite-caller.sh suite-caller.sh

RUN chmod u+x suite-caller.sh
ENV BASE_URL https://httpd:8443

RUN echo 'Listen 8443' > /etc/apache2/ports.conf \
      && a2enmod headers proxy proxy_http rewrite ssl \
      && a2dissite 000-default.conf

COPY httpd-server.conf /etc/apache2/sites-enabled

CMD apachectl start && ./suite-caller.sh