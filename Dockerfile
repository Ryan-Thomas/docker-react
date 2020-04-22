FROM node:alpine

WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx

# Elastic beanstalk will use port 80 as the port that it will receive incoming traffic on
# When running locally, this does nothing
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html