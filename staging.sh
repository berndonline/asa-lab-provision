#!/bin/bash

EXIT=0
vagrant up --color <<< 'boot' || EXIT=$?i
sleep 30
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../cisco_router_config.yml <<< 'prepare router config' || EXIT=$?
sleep 30
ansible-playbook ../site.yml <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ../asa_check_icmp.yml <<< 'connectivity check' || EXIT=$?
vagrant destroy -f
echo $EXIT
exit $EXIT
