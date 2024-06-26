# Use Ubuntu focal as the base image
FROM ubuntu:focal AS base

# Set working directory
WORKDIR /usr/local/bin

# Set non-interactive frontend for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies as root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo vim && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible zsh && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

# Create user and set permissions
RUN addgroup --gid 1000 thevuko && \
    adduser --gecos thevuko --uid 1000 --gid 1000 --disabled-password thevuko && \
    echo "thevuko ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER thevuko
WORKDIR /home/thevuko

# Copy files
COPY . .

# Set the default command to start a zsh shell
CMD ["bash"]
