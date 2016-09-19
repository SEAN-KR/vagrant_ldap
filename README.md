# README - Install OpenLDAP & phpLDAP-Admin

Test that LDAP is working using:

```
sudo ldapsearch -x -b 'dc=home,dc=net'
```

## Configure OpenLDAP

```
sudo dpkg-reconfigure slapd

For the prompts:
Omit OpenLDAP server configuration:  No
DNS domain name:        home.net
Organization name:      demo
Administrator password: support  (confirmation: support)
Database backend:       HDB
Remove the database:    No
Move old database:      Yes
Allow LDAPv2 protocol:  No
```


## Test web interface via phpLDAPadmin

Using your web browser, visit:

```
http://localhost:3080/phpldapadmin
```

Make sure you update the Login DN to is uses home and net like so:

```
cn=admin,dc=home,dc=net
```

And for the password, you can use support (or whatever you choose above.)


## Import some sample Users

There are several sample user LDIF files in the /home/vagrant/files directory.
To add these users, follow the example below:

```
sudo ldapadd -x -W -D "cn=admin,dc=home,dc=net" -f [file_name_here]

Example:
sudo ldapadd -x -W -D "cn=admin,dc=home,dc=net" -f malcolm.ldif 
```

You will be prompted for the LDAP admin password.  If you followed the example
in this guide, that password is:  'support'


