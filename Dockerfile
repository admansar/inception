FROM ubuntu
RUN apt update && apt upgrade -y 
RUN apt install vim -y
