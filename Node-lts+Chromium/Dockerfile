FROM node:lts-alpine
WORKDIR /usr/src/current

RUN apk upgrade --no-cache --available
RUN apk add --no-cache \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
      chromium
RUN apk add --no-cache \
      ttf-freefont \
      font-noto-emoji
RUN apk add --no-cache \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
      wqy-zenhei
RUN apk add --no-cache \
      tini make gcc g++ python3 git nodejs npm yarn

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN yarn global add puppeteer

ENTRYPOINT ["tini", "--"]