###
#
# Used to setup and configure the vagrant box for
# using OpenCart
#

$requiredPackages = [
    'apache2',
    'libapache2-mod-php5',
    'mysql-server',
    'mysql-client',
]

package { $requiredPackages:
    ensure => latest,
}

$extraPackages = [
    'vim',
]

package { $extraPackages:
    ensure => latest,
}

$phpPackages = [
    'php5-mysql',
    'php5-xdebug',
    'php5-curl',
    'php5-gd',
    'php5-json',
    'php5-mcrypt',
]

package { $phpPackages:
    ensure => latest,
    notify => Service['apache2']
}

$vhost = "
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/opencart/web/upload
	<Directory /var/www/opencart/web/upload>
		AllowOverride All
	</Directory>
</VirtualHost>
"

file { '/etc/apache2/sites-enabled/000-default.conf':
	content => "$vhost",
    require => Package['apache2'],
    notify  => Service['apache2'],
}

service { 'apache2':
    ensure  => running,
    require => Package['apache2']
}

exec { 'enable mcrypt':
    command => '/usr/sbin/php5enmod mcrypt',
    require => Package['php5-mcrypt'],
    notify  => Service['apache2'],
}

exec { 'create database':
    command => '/usr/bin/mysqladmin create opencart -u root',
    require => Package['mysql-server'],
}
