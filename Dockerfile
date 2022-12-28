FROM ubuntu:22.04

LABEL maintainer="simojenki"

RUN apt-get update && \
    apt-get install -y \
        nodejs \
        npm && \
    mkdir /meshcommander

WORKDIR /meshcommander

ARG MESHCOMMANDER_VERSION=0.0.0
RUN npm install meshcommander@${MESHCOMMANDER_VERSION}

EXPOSE 3000

ENTRYPOINT [ "node" , "/meshcommander/node_modules/meshcommander", "--any", "--port", "3000" ]

