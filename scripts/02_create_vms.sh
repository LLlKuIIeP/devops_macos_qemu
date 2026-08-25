#!/usr/bin/env bash

set -x
cd ansible
ansible-playbook -t create_qemu_vms playbook.yml
ansible-playbook -i inventory -t wait_ssh playbook.yml
ansible-playbook -i inventory -t apt_upgrade playbook.yml
ansible-playbook -i inventory -t reboot_vm playbook.yml
ansible-playbook -i inventory -t set_hostname playbook.yml
ansible-playbook -i inventory -t netplan playbook.yml
set -x
