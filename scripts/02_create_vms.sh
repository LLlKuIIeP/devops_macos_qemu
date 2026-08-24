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




# set -x

# mkdir -p images cloud-init

# cd images
# wget -nc https://cloud-images.ubuntu.com/releases/resolute/release/ubuntu-26.04-server-cloudimg-arm64.img

# CLOUD_IMG="$(pwd)/ubuntu-26.04-server-cloudimg-arm64.img"

# VMS=("ubuntu-1" "ubuntu-2" "ubuntu-3")
# for item in "${VMS[@]}"; do
#     rm -f ${item}.qcow2
#     qemu-img create -f qcow2 -F qcow2 -b "$CLOUD_IMG" ${item}.qcow2
#     qemu-img resize ${item}.qcow2 40G
# done

# cd ..

# cat <<EOF > cloud-init/meta-data
# instance-id: ubuntu-vm
# local-hostname: ubuntu-vm
# EOF

# cat <<EOF > cloud-init/user-data
# #cloud-config
# hostname: ubuntu-vm
# manage_etc_hosts: true

# users:
#   - name: user
#     groups: sudo
#     shell: /bin/bash
#     sudo: ['ALL=(ALL) NOPASSWD:ALL']
#     lock_passwd: false
#     passwd: "\$6\$P1IMS1N5ymXTJ9JW\$jegH3CTfm7ze4SODSrIEf6GP9qUZVvhtx3qUhp.7x/DiMycszqXPoppDkEr/udMKkVEmCzx6C/HbEOa7glDEp/"
#     ssh_authorized_keys:
#       - 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaQ1E3d3O8M9BBc3PYXobv9NsC5GITIEnGr1fQk1DNA sergey@sergey-VivoBook'

# chpasswd:
#   expire: false

# ssh_pwauth: true

# runcmd:
#   - echo "cloud-init finished" > /root/cloud-init-done
# EOF


# cd images
# rm -f cidata.iso
# hdiutil makehybrid \
#   -o cidata.iso \
#   -iso \
#   -joliet \
#   -joliet-volume-name cidata \
#   -iso-volume-name cidata \
#   ../cloud-init/


# #packer validate packer-orbstack/ubuntu-server-2604-orbstack.pkr.hcl
# #packer build packer-orbstack/ubuntu-server-2604-orbstack.pkr.hcl
