FROM ubuntu:focal

RUN apt update
RUN apt install -y software-properties-common curl apt-transport-https ca-certificates gnupg nginx
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install -y php7.4 
RUN apt install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php7.4-fpm

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
