# We need to use something close to
FROM node:10-alpine

ENV FIREBASE_TOOLS_VERSION=8.2.0

RUN npm i -g firebase-tools@${FIREBASE_TOOLS_VERSION} && \
    npm cache clean --force && \
    apk --no-cache add openjdk8-jre bash

COPY firebase.json .

RUN firebase --open-sesame emulatorgui && \
    firebase setup:emulators:database && \
    firebase setup:emulators:firestore && \
    firebase setup:emulators:pubsub && \
    sed -i 's/getExecPath(types_1.Emulators.DATABASE)/"-Xmx3g", getExecPath(types_1.Emulators.DATABASE)/' /usr/local/lib/node_modules/firebase-tools/lib/emulator/downloadableEmulators.js

WORKDIR /app

CMD firebase emulators:start --project=dev
