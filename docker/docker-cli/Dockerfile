FROM gocd/gocd-agent-ubuntu-16.04:v17.9.0

# docker CLI in a docker container </xzhibit
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#recommended-extra-packages-for-trusty-1404

# INSTALL THE DOCKER CLI
# ======================

RUN apt-get -qq update

# Stuff to install from a repo over https
RUN apt-get -q -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    sudo \
    software-properties-common

# keys
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN apt-key fingerprint 0EBFCD88

# add repo
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get -qq update
RUN apt-get -q -y install docker-ce

RUN docker --version
