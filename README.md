# Docker repository

This is a git repository for public common dockerfiles.
All container are for pipeline CI/CD or tests purpose.
Built every night, and eventually when needed.

Docker containers:

- NodeJs with Chromium
- Conformance Suite
- OBB Certification

## NodeJs with Chromium

For ui tests using headless brownser and nodejs applications
It can be used as a base image

## Conformance Suite

For openid certification tests.
Copied and modified from https://gitlab.com/openid/conformance-suite.
It allows you to run the https://www.certification.openid.net tests locally.

## OBB Certification

For Openbanking Brazil certification tests.
Copied and modified from https://gitlab.com/obb1/certification.
It allows you to run the https://web.conformance.directory.openbankingbrasil.org.br tests locally.
