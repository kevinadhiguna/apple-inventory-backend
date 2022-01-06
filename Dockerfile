### - Define base image - ###
FROM node:12-alpine

# Note : due to Sharp issue, it is recommended to use NodeJS v12 than v14 or v16.

WORKDIR /app

### - Installing dependencies - ###
COPY package.json .
COPY yarn.lock .

# RUN yarn --frozen-lockfile
RUN yarn

### - Copy required directories/files - ###
COPY public/robots.txt public/robots.txt
COPY extensions/ extensions/
COPY config/ config/
COPY api/ api/

### - Production build - ###
RUN yarn build

### - Port Binding - ###
EXPOSE 1337

### - Start the app - ###
CMD [ "yarn", "start" ]
