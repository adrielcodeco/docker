FROM maven:3-jdk-11 AS builder

WORKDIR /usr/src/conformance-suite

RUN git clone https://gitlab.com/openid/conformance-suite.git .

RUN mvn --batch-mode --quiet clean package

FROM openjdk:21-jdk-slim-bullseye

WORKDIR /usr/src/conformance-suite

RUN apt-get update
RUN apt-get install -y \
        redir \
        apache2 \
        ssl-cert \
        curl \
        wget
RUN apt-get clean

COPY --from=builder /usr/src/conformance-suite/target  /server
COPY conformance-suite/suite-caller.sh suite-caller.sh

RUN chmod u+x suite-caller.sh
ENV BASE_URL https://localhost.emobix.co.uk:8443

RUN echo 'Listen 8443' > /etc/apache2/ports.conf \
      && a2enmod headers proxy proxy_http rewrite ssl \
      && a2dissite 000-default.conf

COPY conformance-suite/httpd-server.conf /etc/apache2/sites-enabled

CMD apachectl start && ./suite-caller.sh
