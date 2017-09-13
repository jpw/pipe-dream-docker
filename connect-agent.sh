#!/bin/bash

HOST_IP="$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | grep 192 | awk '{print $2}')"
echo "Using host IP " $HOST_IP
# auto-register the agents
# note: this must be an https URL, so the port will also be not the default 8153
docker run -d \
		-e "GO_SERVER_URL=https://$HOST_IP:8154/go" \
		-e "AGENT_AUTO_REGISTER_KEY=e73034c6-ced8-41fc-bc0c-002724174103" \
		-e "AGENT_AUTO_REGISTER_RESOURCES=push" \
		-e "AGENT_AUTO_REGISTER_HOSTNAME=docker-agent-cf-cli "\
		jpwdocker/cf-cli:latest

# that did the cf-cli agent, let's try a docker cli agent too;

docker run -d \
		-e "GO_SERVER_URL=https://$HOST_IP:8154/go" \
		-e "AGENT_AUTO_REGISTER_KEY=e73034c6-ced8-41fc-bc0c-002724174103" \
		-e "AGENT_AUTO_REGISTER_RESOURCES=configure, build" \
		-e "AGENT_AUTO_REGISTER_HOSTNAME=docker-agent-docker-cli "\
		jpwdocker/docker-cli:latest


#        -e AGENT_AUTO_REGISTER_ENVIRONMENTS=... \

# It can take a good 10 secs before available in the GUI http://localhost:8153/go/agents#!/agentState/asc
# If you have problems;
# Check if the docker container is running docker ps -a
# Check the STDOUT to see if there is any output that indicates failures docker logs CONTAINER_ID
# Check the agent logs docker exec -it CONTAINER_ID /bin/bash, then run less /godata/logs/*.log inside the container.
