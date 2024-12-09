FROM keymetrics/pm2:18-alpine

COPY ./packages packages/
COPY package.json .
COPY yarn.lock .
COPY scan.pm2.yaml .

ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

RUN ls -al -R

CMD ["pm2-runtime", "start", "scan.pm2.yaml", "--env=production"]