FROM node:16.1.0

WORKDIR /usr/src/app
COPY ./pages ./pages
COPY ./public ./public
COPY ./styles ./styles
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install && npm run build

RUN groupadd -r nextjs && useradd -r -g nextjs nextjs
USER nextjs
CMD ["npm", "run", "start"]
