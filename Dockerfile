FROM alpine:3.17.2
RUN apk update
RUN apk fix
RUN apk add nodejs
RUN apk add npm
RUN apk add git
RUN npm install -g @angular/cli
RUN npm install -g typescript
RUN mkdir -p /var/opt/angular