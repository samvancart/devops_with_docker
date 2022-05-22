FROM alpine:3.13

RUN apk update && \ 
    apk --no-cache add git && \
    apk add --update docker openrc && \
    rc-update add docker boot

WORKDIR usr/src/app

COPY . .

RUN chmod +x build-service.sh

ENTRYPOINT ["./build-service.sh"]