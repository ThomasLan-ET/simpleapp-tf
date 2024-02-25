FROM node:20.11.1-alpine AS build
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
COPY --chown=node:node . .
RUN npm i && npm run build

FROM nginx:alpine
COPY --from=build /home/node/app/build /usr/share/nginx/html
EXPOSE 80 
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]