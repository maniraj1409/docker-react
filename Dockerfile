FROM node:alpine as builder

WORKDIR	'/new'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx 

COPY --from=builder /new/build /usr/share/nginx/html


