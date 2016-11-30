toilet --gay phpLDAP-Admin

sudo cp /home/vagrant/LDAP_CONFIG/config.php /etc/phpldapadmin/config.php

ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/groups.ldif
ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/users.ldif

ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/hw.ldif
ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/sw.ldif

ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/jang.ldif
ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/kim.ldif
ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/nam.ldif
ldapadd -x -D "cn=admin,dc=home,dc=net" -w pass1234 -H ldap://localhost -f /home/vagrant/LDAP_CONFIG/san.ldif  