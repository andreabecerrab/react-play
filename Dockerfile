FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#for run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html