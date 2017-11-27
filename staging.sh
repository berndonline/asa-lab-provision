#!/bin/bash

EXIT=0
vagrant up rtr-1 rtr-2 --color <<< 'boot' || EXIT=$?
sleep 30
vagrant up asa-1 --color <<< 'boot' || EXIT=$?
sleep 40
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../cisco_router_config.yml <<< 'prepare router config' || EXIT=$?
sleep 30
ansible-playbook ../site.yml <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ../asa_check_icmp.yml <<< 'connectivity check' || EXIT=$?
vagrant destroy -f
echo $EXIT
exit $EXIT
