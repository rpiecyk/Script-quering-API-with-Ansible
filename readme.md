## Dockerized script quering macaddress.io for Company Name

This repository was created for the purpose of getting **company name** via https://macaddress.io/ web page by providing device **MAC address** to the ansible playbook via it's argument.

##### Security

For safety purpose it is worth to considered  making tasks run docker in the rootless mode or to use port mapping in the future - in case of eventual breach into container. It allows for possibility of escaping namespace into the docker's host. Whereas container should run for an instance it is a good practice.
It is also recommended to add some Mandatory Access Control rules with use of AppArmor or SELinux.
As of now due to time constrains this functionality **will be skipped**.

In case of passing parameters such as **token** to the environment it is recommended to use external files, preferably encrypted ones.
It allows to avoid passing confidential data in a clear text which for example could be looked up in files stored in repository.
In this case external file has been used - it has been placed in host_vars directory. It is not encrypted at the moment.

##### Usage

Firstly, it is ***mandatory*** to save your **token** in `host_vars/localhost` file. Otherwise, playbook will not run.

If ansible was not installed beforehand debian based script **install_ansible.sh** will install the tool. For other distributions it is required to modify packet manager and packet names accordingly.
`./install_ansible.sh`

Playbook named **playbook.yml** uses role **query** placed in **roles** catalogue. This role execute tasks placed in **main.yml** file which abosulte path is **roles/query/tasks/main.yml**.

To run the playbook it is need to run command with desired MAC_ADDRESS passed as an environment variable:

`ansible-playbook playbook.yml -e "mac=QUERIED_MAC_ADDRESS"`

Upon finish, last defined task returns Company Name value of queried MAC_ADDRESS.
