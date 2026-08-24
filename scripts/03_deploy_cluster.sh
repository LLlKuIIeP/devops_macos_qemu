#!/usr/bin/env bash

set -x
cd ansible
ansible-playbook -i inventory -t hashistack playbook.yml
set -x
