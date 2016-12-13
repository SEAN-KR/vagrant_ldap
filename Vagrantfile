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
  config.vm.provision "file", source: "files/groups.ldif", destination: "/home/vagrant/LDAP_CONFIG/groups.ldif"
  config.vm.provision "file", source: "files/users.ldif", destination: "/home/vagrant/LDAP_CONFIG/users.ldif"
  config.vm.provision "file", source: "files/hw.ldif", destination: "/home/vagrant/LDAP_CONFIG/hw.ldif"
  config.vm.provision "file", source: "files/jang.ldif", destination: "/home/vagrant/LDAP_CONFIG/jang.ldif"
  config.vm.provision "file", source: "files/kim.ldif", destination: "/home/vagrant/LDAP_CONFIG/kim.ldif"
  config.vm.provision "file", source: "files/nam.ldif", destination: "/home/vagrant/LDAP_CONFIG/nam.ldif"
  config.vm.provision "file", source: "files/san.ldif", destination: "/home/vagrant/LDAP_CONFIG/san.ldif"
  config.vm.provision "file", source: "files/sw.ldif", destination: "/home/vagrant/LDAP_CONFIG/sw.ldif"
  
  # Run provisioning specific to setting up Salt 
  config.vm.provision "shell", path: 'provisioning/phpldapadmin_provision.sh'
  
  # Support for phpLDAPadmin on port 80
  config.vm.network "forwarded_port", guest: 80, host: 8085, id: "phpldapadmin"
  config.vm.network "forwarded_port", guest: 389, host: 3890, id: "openldap"
  config.vm.network "forwarded_port", guest: 4200, host: 4205, id: "shellinabox"
  
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

    sudo apt-get -y install phpldapadmin shellinabox
    sed -e s/password_hash/password_hash_custom/g /usr/share/phpldapadmin/lib/TemplateRender.php > ~/TemplateRender.php.tmp
    sudo mv ~/TemplateRender.php.tmp /usr/share/phpldapadmin/lib/TemplateRender.php
  eos
end
