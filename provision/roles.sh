#! /bin/sh

#make current dir same as file dir
SCRIPT_DIR=`dirname $0`

roles=(
#"gano2018.ansible_os_init" depended
#"gano2018.ansible_git"     dependedß
"gano2018.ansible_gitflow"
"gano2018.ansible_github_ssh"
"geerlingguy.jenkins"
#"ansible_jenkins"
)

for role in ${roles[@]}
do
  ansible-galaxy install $role --roles-path roles/
done
