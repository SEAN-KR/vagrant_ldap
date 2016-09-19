Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "odapper.home.net" 

  # Setup static ip address to be used with the Atlassian Suite of Application Servers
  config.vm.network "private_network", ip: "192.168.50.80"

  # Use an inline shell provisioner for basic setup 
  config.vm.provision 'shell', inline: shell, privileged: false

  # Copy phpldapadmin config file
  config.vm.provision "file", source: "files/config.php", destination: "config.php"

  # Copy sample set of users to import into OpenLDAP
  config.vm.provision "file", source: "files/malcolm.ldif", destination: "malcolm.ldif"
  config.vm.provision "file", source: "files/jayne.ldif", destination: "jayne.ldif"
  config.vm.provision "file", source: "files/inara.ldif", destination: "inara.ldif"
  config.vm.provision "file", source: "files/wash.ldif", destination: "wash.ldif"
  config.vm.provision "file", source: "files/zoe.ldif", destination: "zoe.ldif"
  config.vm.provision "file", source: "files/kaylee.ldif", destination: "kaylee.ldif"
  config.vm.provision "file", source: "files/jfhogarty.ldif", destination: "jfhogarty.ldif"
  
  # Support for phpLDAPadmin on port 80
  config.vm.network "forwarded_port", guest: 80, host: 3080, id: "phpldapadmin"
  
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus   = 1
  end
end

def shell
  <<-eos
    echo Installing basic tools 
    sudo apt-get update
    sudo apt-get -y install vim git-core toilet

    export DEBIAN_FRONTEND=noninteractive
    echo -e " \
    slapd    slapd/internal/generated_adminpw    password   openstack
    slapd    slapd/password2    password    openstack
    slapd    slapd/internal/adminpw    password openstack
    slapd    slapd/password1    password    openstack
    " | sudo debconf-set-selections
    sudo apt-get -y install slapd ldap-utils

    sudo apt-get -y install phpldapadmin
    sudo cp /home/vagrant/files/config.php /etc/phpldapadmin/config.php
  eos
end
