Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

#VM3: Jenkins

# Use `define` to create our instance
  config.vm.define "jenkins" do |instance|
  # So we know which instance we're in easily in termninal
  	instance.vm.hostname = "jenkins"
  end

 ########################################
 
  config.vm.network :private_network, ip: "192.168.25.23"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
#  config.vm.hostname "jenkins"

  config.vm.provider "virtualbox" do |jenkins|
    jenkins.gui = false
    jenkins.name = "jenkins"
    jenkins.cpus = 2
    jenkins.memory = "2048"
  end
  
  config.vm.provision "shell" do |shell|
    shell.path = "jenkins.sh"
  end
#VM2: Node

# Use `define` to create our instance
  config.vm.define "apps" do |instance|
  # So we know which instance we're in easily in termninal
  	instance.vm.hostname = "apps"
  end

 ########################################

  config.vm.network :private_network, ip: "192.168.25.24"
#  config.vm.hostname "apps"

  config.vm.provider "virtualbox" do |node|
    node.gui = false
    node.name = "apps"
    node.cpus = 2
    node.memory = "2048"
  end

  config.vm.provision "shell" do |shell|
    shell.path = "provishing.sh"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

end


#VM3: Node2
# config.vm.define "node2" do |node2|
# node2.vm.box = "centos/7"
# node2.vm.hostname = "Node2"
# node2.vm.network :private_network, ip: "192.168.11.13"
# node2.ssh.insert_key = false
