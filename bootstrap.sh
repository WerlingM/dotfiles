#!/bin/bash

set -e

# Notes: assumes script invoked with sudo

# pip is needed to install Ansible
if ! [ -x "$(command -v pip)" ]; then
  echo 'Error: pip is not installed.' >&2
  apt install python3-pip
fi

# install ansible and 
pip install ansible
wget https://raw.githubusercontent.com/caian-org/ansible-stow/v1.2.1/stow -o stow-download
mv stow-download /usr/share/ansible/stow

# run the playbook
ansible-playbook bootstrap.yaml
echo "Done"