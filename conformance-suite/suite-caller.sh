#!/bin/bash

java \
    -jar /server/fapi-test-suite.jar \
    --fintechlabs.base_url=$BASE_URL \
    --fintechlabs.devmode=true \
    --fintechlabs.startredir=true \
    -D"spring.data.mongodb.uri=mongodb://${MONGODB_HOST}:27017/test_suite" \
    -Djdk.tls.maxHandshakeMessageSize=65536
