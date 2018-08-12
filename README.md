# my-ansible-playbooks
My Ansible Playbooks for BizotDC domain admin

############### Openshift #################

ocpadmin account 
  ansible-playbook -i inventory/ocp39inv /usr/share/ansible/openshift-ansible/playbooks/openshift-node/scaleup.yml --private-key /home/ocpadmin/.ssh/id_rsa

