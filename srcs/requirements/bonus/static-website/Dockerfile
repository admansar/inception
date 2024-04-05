FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install apache2 -y

COPY ./tools /

EXPOSE 8000

CMD bash entry.sh
