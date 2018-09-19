# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # jenkins用サーバ
  config.vm.define :jenkins do |jenkins|
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.box = "bento/ubuntu-16.04"
    jenkins.vm.network "private_network" , ip: "192.168.9.11"

    #メモリ　512MB
    jenkins.vm.provider "virtualbox" do |vm|
      vm.customize ["modifyvm", :id, "--memory", "512"]
    end

    jenkins.vm.synced_folder "app", "/home/doc_root/game-of-life",
      id: "vagrant-root1", :nfs => false,
      :owner => "vagrant",
      :group => "www-data",
      :mount_options => ["dmode=775,fmode=775"]

    jenkins.vm.synced_folder "provision", "/home/vagrant/provision",
      id: "vagrant-root", :nfs => false,
      :owner => "vagrant",
      :group => "vagrant",
      :mount_options => ["dmode=755,fmode=755"]

    jenkins.vm.provision "shell", inline: <<-SHELL
      echo "#!/bin/sh\n ansible-playbook -i localhost, -c local /home/vagrant/provision/playbook.yml" > /home/vagrant/provision.sh
    SHELL

    jenkins.vm.provision "ansible_local" do |ansible|
      #ansible on Guest OS
      ansible.playbook = "provision_local/playbook.yml"
      #ansible on Host OS
      #ansible.playbook = "provision/playbook.yml"
      #ansible.install = true #Ansibleを自動でインストールさせる
    end
  end

end
