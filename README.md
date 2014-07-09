joshuaestes/vagrant-opencart
============================

This repository allows you to setup an OpenCart install using
vagrant for development and testing.

# Installation

```bash
git clone --recursive https://github.com/JoshuaEstes/vagrant-opencart.git
cd vagrant-opencart
vagrant up
```

Open your browser to 127.0.0.1:8080

# Configuration

This setup will install mysql and create the database for you. During the
OpenCart install, it will ask for your database information. There is
no password and the username is `root`. The database name is `opencart`
