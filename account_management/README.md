# user management playbooks:

## add_user.yml
Creates a user acount with the provided info on the remote machine(s).

usage: 
##
	ansible-playbooks -l host(s) add_user.yml --ask-become-pass

## add_keys.yml
Ensure .ssh folder and public key for a specified user is provisioned correctly.

usage:
##
        ansible-playbooks -l host(s) add_key.yml --ask-become-pass

## user_accounts.yml
Provisiong the system with the provided list of user accounts/UIDs/Keys/etc. 
this playbook requires an list of the mentioned environment variable placed in group_vars

usage:
##
	ansible-playbook -l host(s) user_accounts.yml
