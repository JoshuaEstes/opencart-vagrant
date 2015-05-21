joshuaestes/opencart-vagrant
============================

This repository allows you to setup an OpenCart install using
vagrant for development and testing.

# Requirements

* [Virtual Box](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)

# Installation

```bash
git clone --recursive https://github.com/JoshuaEstes/vagrant-opencart.git
cd vagrant-opencart
curl -sS https://getcomposer.org/installer | php
php composer.phar install
vagrant up
```

Open your browser to 127.0.0.1:8080 and go through the OpenCart installation
wizard.

# Configuration

This setup will install mysql and create the database for you. During the
OpenCart install, it will ask for your database information. There is
no password and the username is `root`. The database name is `opencart`

# Important Notes

When you are done with the machine, do not forget to halt the machine first in
order to avoid data corruption, if you did forget to halt the machine, you will
run into errors with starting mysql and will have to remove the files:
   ./db/mysql/ib_logfile0
    -and-
   ./db/mysql/ib_logfile1
