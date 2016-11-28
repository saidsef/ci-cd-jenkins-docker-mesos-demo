FROM jenkins:2.19.3

USER root

ENV DOCKER_ENGINE_VERSION  1.12.3-0~jessie
ENV DOCKER_COMPOSE_VERSION 1.9.0

# installation steps from https://docs.docker.com/engine/installation/linux/debian/
RUN wget -qO- https://get.docker.com/ | sh
RUN apt-get update \
    && apt-get install apt-transport-https ca-certificates rsync -y \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install docker -y \
    && gpasswd -a jenkins docker \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins

