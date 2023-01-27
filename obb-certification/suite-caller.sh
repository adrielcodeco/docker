#!/bin/bash

java \
    -jar /server/fapi-test-suite.jar \
    -Djdk.tls.maxHandshakeMessageSize=65536
    --fintechlabs.base_url=$BASE_URL \
    --fintechlabs.devmode=true \
    --fintechlabs.startredir=true