FROM debian:12

RUN apt update && apt upgrade -y 

RUN apt install -y nginx ca-certificates vim && openssl req -subj '/CN=example.com /O=adnan /C=MR' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout server.key -out server.crt

COPY ./default.conf  /etc/nginx/conf.d/

COPY ./a.html  /var/www/html/

CMD ["nginx",  "-g",  "daemon off;"]
