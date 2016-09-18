Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "odapper.home.net" 

  # Setup static ip address to be used with the Atlassian Suite of Application Servers
  config.vm.network "private_network", ip: "192.168.50.80"

  # Use an inline shell provisioner for basic setup 
  config.vm.provision 'shell', inline: shell, privileged: false

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
  eos
end
