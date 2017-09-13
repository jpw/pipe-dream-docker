FROM gocd/gocd-agent-ubuntu-14.04:v17.9.0

# and also from https://hub.docker.com/r/webcenter/alpine-gocd-agent/~/dockerfile/ :P
# build with:	docker build -t jpwdocker/cf-cli .
# push with: 	docker push jpwdocker/cf-cli

ENV PACKAGES "unzip curl openssl ca-certificates git" 
RUN apt install $PACKAGES

# Installs the cf CLI
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx -C /usr/local/bin
RUN cf --version
