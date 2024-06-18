# Ansible Setup and Playbook Execution

This guide provides the steps to set up Ansible and run the provided playbook from this repository.

## Prerequisites

Make sure you have the following installed on your system:

- Git
- Bash

## Installation and Execution

Follow these steps to install Ansible and run the playbook:

1. Install Ansible

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
```

Run the Ansible playbook

```bash
ansible-pull -U https://github.com/vukovuko/ansible.git
```
