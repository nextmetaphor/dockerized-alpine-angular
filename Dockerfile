FROM alpine:latest
RUN apk update
RUN apk fix
RUN apk add nodejs
RUN apk add nodejs-npm
RUN npm install -g @angular/cli
RUN npm install -g typescript
RUN mkdir -p /var/opt/angular