vagrant up asa-1 --color
vagrant up asa-2 --color
sleep 5
script -e -c 'ansible-playbook ../site.yml'
exit_code=$?
vagrant destroy -f
exit $exit_code

