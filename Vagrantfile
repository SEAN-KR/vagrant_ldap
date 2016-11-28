Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "odapper.home.net" 

  # Setup static ip address to be used with the Atlassian Suite of Application Servers
  # config.vm.network "private_network", ip: "192.168.50.80"

  # Use an inline shell provisioner for basic setup 
  config.vm.provision 'shell', inline: shell, privileged: false

  # Copy phpldapadmin config file
  config.vm.provision "file", source: "files/config.php", destination: "/home/vagrant/LDAP_CONFIG/config.php"

  # Copy sample set of users to import into OpenLDAP
  config.vm.provision "file", source: "files/malcolm.ldif", destination: "/home/vagrant/LDAP_CONFIG/malcolm.ldif"
  config.vm.provision "file", source: "files/jayne.ldif", destination: "/home/vagrant/LDAP_CONFIG/jayne.ldif"
  config.vm.provision "file", source: "files/inara.ldif", destination: "/home/vagrant/LDAP_CONFIG/inara.ldif"
  config.vm.provision "file", source: "files/wash.ldif", destination: "/home/vagrant/LDAP_CONFIG/wash.ldif"
  config.vm.provision "file", source: "files/zoe.ldif", destination: "/home/vagrant/LDAP_CONFIG/zoe.ldif"
  config.vm.provision "file", source: "files/kaylee.ldif", destination: "/home/vagrant/LDAP_CONFIG/kaylee.ldif"
  config.vm.provision "file", source: "files/jfhogarty.ldif", destination: "/home/vagrant/LDAP_CONFIG/jfhogarty.ldif"
  
  # Run provisioning specific to setting up Salt 
  config.vm.provision "shell", path: 'provisioning/phpldapadmin_provision.sh'
  
  # Support for phpLDAPadmin on port 80
  config.vm.network "forwarded_port", guest: 80, host: 8085, id: "phpldapadmin"
  config.vm.network "forwarded_port", guest: 3890, host: 3890, id: "openldap"
  
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus   = 1
  end
end

def shell
  <<-eos
    echo Make directory for LDAP Config files
    mkdir /home/vagrant/LDAP_CONFIG

    echo Installing basic tools 
    sudo apt-get update
    sudo apt-get -y install vim git-core toilet

    export DEBIAN_FRONTEND=noninteractive
    echo -e " \
    slapd slapd/internal/generated_adminpw password pass1234
    slapd slapd/password2 password pass1234
    slapd slapd/internal/adminpw password pass1234
    slapd slapd/password1 password pass1234
    " | sudo debconf-set-selections
    sudo apt-get -y install slapd ldap-utils

    sudo apt-get -y install phpldapadmin
  eos
end
