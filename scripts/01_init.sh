#!/usr/bin/env bash

set -x

brew install ansible
ansible --version
cd ansible
ansible-galaxy collection install -r requirements.yml
ansible-playbook -t install playbook.yml
ansible-playbook -t download playbook.yml
ansible-playbook -t create_vm_disks playbook.yml
ansible-playbook -t create_cloudinit_iso playbook.yml
ansible-playbook -t create_ovmf_vars playbook.yml
set -x

#brew tap hashicorp/tap
#brew install hashicorp/tap/packer

#packer --version

# curl https://cdimage.ubuntu.com/ubuntu/releases/26.04/release/SHA256SUMS | grep server-arm64.iso | awk '{ print $1 }'
