# ansible-playbooks

Ansible is an automation tool. Main advantages are, its simple yet very powerful and works client-less-ly over ssh.
Ansible CLI is open source, there is a licensed enterprise console with value-add features offered called Tower.
Full documentation is available here.
 

## Quick Start
Choose a "control machine" or management box where you will be administering the infrastructure on.
Ansible can be installed from yum package repository directly or from github.

## Install ansible
    sudo yum install -y epel-release
    sudo yum install -y ansible

## Create a working directory in your home for ansible playbooks and host inventory files. 
    mkdir -p ~/ansible-playbooks

## Create a localized .ansible.cfg file in your home directory, where your ansible environment preferences will be stored.
    vim ~/.ansible.cfg

Insert the following for a baseline simple operations of ansible for your account. Full list of config variable that can be localized can be found here.

    [defaults]
    ssh_args = -o ForwardAgent=yes
    host_key_checking = False
    executable = /bin/bash
    forks = 5
    gathering = smart
    inventory = ~/ansible-playbooks/hosts
    remote_user= username
    private_key_file= ~/.ssh/id_rsa

## Create and populate your inventory file with resolvable hostnames or IP addresses of the remote servers.

    vim ~/ansible-playbooks/hosts

You can define named-groups or multiple hosts using bracket notation. View example hosts file below.

    [group01]
    dc-host[01:07]
    host-app08
    host-srv[01:04]
    [group02]
    microhost1
    microhost2
    micro-manage
 
*Note: You must already have ssh access for your user on these hosts. Also it is recommended to use ssh keys to avoid having to input password for each host upon running your ansible command.
at this point, you are ready to use ansible. Either via running a simple ad-hoc command on all boxes or writing more complex playbooks.
 
## Running an Ad-hoc command
ansible provides many built in modules that can be use to accomplish simple tasks, also any linux command in bash or shell can be run using the "command" module. More info can be found here. Below are two examples.

using ansible modules: 

    ansible all -m ping

using linux commands:

    ansible datacenter01 -m command -a "free -m"
