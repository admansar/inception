FROM alpine

RUN apk update && apk upgrade --available
RUN apk add vim

#COPY ./.ashrc /root/
