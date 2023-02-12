FROM maven:3-jdk-11 AS builder

WORKDIR /usr/src/obb-certification

RUN git clone https://gitlab.com/obb1/certification.git .

RUN mvn -B clean package

FROM openjdk:11-jdk-slim

WORKDIR /usr/src/obb-certification

RUN apt-get update
RUN apt-get install -y \
        redir \
        apache2 \
        ssl-cert \
        curl \
        wget
RUN apt-get clean

COPY --from=builder /usr/src/obb-certification/target  /server
COPY obb-certification/suite-caller.sh suite-caller.sh

RUN chmod u+x suite-caller.sh
ENV BASE_URL https://localhost.emobix.co.uk:8443

RUN echo 'Listen 8443' > /etc/apache2/ports.conf \
      && a2enmod headers proxy proxy_http rewrite ssl \
      && a2dissite 000-default.conf

COPY obb-certification/httpd-server.conf /etc/apache2/sites-enabled

CMD apachectl start && ./suite-caller.sh
