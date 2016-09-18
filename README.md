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

## Configure phpLAPadmin

I think I may need to do some configuration here.
Need to research.



## Test web interface via phpLDAPadmin

Using your web browser, visit:

```
http://localhost:3080
```

Make sure you update the Login DN to is uses home and net like so:

```
cn=admin,dc=home,dc=net
```

And for the password, you can use support (or whatever you choose above.)


## Import some sample Users

Coming Soon!



