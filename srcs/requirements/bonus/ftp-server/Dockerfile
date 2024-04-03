FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install -y vsftpd vim ftp

EXPOSE 201

COPY ./tools /

CMD bash /ftp.sh
