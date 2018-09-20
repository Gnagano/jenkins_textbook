#! /bin/sh

#make current dir same as file dir
SCRIPT_DIR=`dirname $0`
user="gano2018"

roles=(
#"ansible_os_init" depended
#"ansible_git"     dependedß
"ansible_gitflow"
"ansible_java"
"ansible_github_ssh"
)

for role in ${roles[@]}
do
  ansible-galaxy install $user.$role --roles-path roles/
done
