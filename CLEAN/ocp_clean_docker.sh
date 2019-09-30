ansible -i bizotdcinv ocpallnodes -m shell -a "systemctl stop docker"
ansible -i bizotdcinv ocpallnodes -m shell -a "rm -rf /var/lib/docker/*"
ansible -i bizotdcinv ocpallnodes -m shell -a "container-storage-setup --reset"
ansible -i bizotdcinv ocpallnodes -m shell -a "systemctl start docker"
