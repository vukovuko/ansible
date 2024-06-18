# Use Ubuntu focal as the base image
FROM ubuntu:focal AS base

# Set working directory
WORKDIR /usr/local/bin

# Set non-interactive frontend for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

# Create user and set permissions
FROM base AS vuko
ARG TAGS
RUN addgroup --gid 1000 thevuko
RUN adduser --gecos thevuko --uid 1000 --gid 1000 --disabled-password thevuko
USER thevuko
WORKDIR /home/thevuko

# Copy files and set CMD
FROM vuko
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

