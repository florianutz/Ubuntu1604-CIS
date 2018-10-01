#!/bin/sh
#Colors
GREEN='\033[0;32m'
WHITE='\033[0m'

echo "Setup config-files..."
printf '%s\n' '- src: https://github.com/florianutz/Ubuntu1604-CIS.git' \
    '' > requirements.yml
echo -e "\tSaved 'requirements.yml'"
printf '%s\n' '---'\
    ''\
    '- name: Harden Ubuntu 16.04'\
    '  hosts: 127.0.0.1'\
    '  connection: local'\
    '  become: yes'\
    '  vars:'\
    '    ubuntu1604cis_xwindows_required: true'\
    '  roles:'\
    '    - Ubuntu1604-CIS' > ubuntu1604-CIS.yml
echo -e "\tSaved 'ubuntu1604-CIS.yml'"
echo "Installing latest ansible..."
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
echo -e "\tDone."
echo "Installing Ubuntu1604-CIS role.."
sudo ansible-galaxy install -p roles -r requirements.yml
echo -e "\tDone."
echo "Applying Ubuntu1604-CIS role.."
sudo ansible-playbook -K ubuntu1604-CIS.yml
echo -e "${GREEN}DONE.${WHITE}"
