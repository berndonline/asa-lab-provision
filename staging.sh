vagrant up asa-1 --color
exit_code=$?
vagrant up asa-2 --color
exit_code=$?
sleep 5
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ../site.yml
exit_code=$?
vagrant destroy -f
exit $exit_code
