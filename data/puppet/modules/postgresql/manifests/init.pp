# == Class: postgresql
#
# Installs PostgreSQL and sets config file.
#
class postgresql {
  require core
	
  package { 'postgresql':
    ensure => present;
  }

  package { 'postgresql-contrib':
    require => Package['postgresql'],
    ensure => present;
  }

  package { 'postgresql-9.3-postgis-scripts':
    ensure => present;
  }

  file { '/etc/postgresql/9.3/main/environment':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/environment',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_ctl.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_ctl.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_hba.conf':
    owner => postgres,
    group => postgres,
    mode => 0640,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_hba.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_ident.conf':
    owner => postgres,
    group => postgres,
    mode => 0640,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_ident.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/postgresql.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/postgresql.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/start.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/start.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  service { 'postgresql':
    ensure  => running,
    require => [
      Package['postgresql'],
      Package['postgresql-9.3-postgis-scripts'],
      File['/etc/postgresql/9.3/main/environment'],
      File['/etc/postgresql/9.3/main/pg_ctl.conf'],
      File['/etc/postgresql/9.3/main/pg_hba.conf'],
      File['/etc/postgresql/9.3/main/pg_ident.conf'],
      File['/etc/postgresql/9.3/main/postgresql.conf'],
      File['/etc/postgresql/9.3/main/start.conf'],
    ];
  }

  file { '/home/apollon/scripts/create-postgresql-user.sh':
    owner => postgres,
    group => postgres,
    mode => 0755,
    source  => 'puppet:///modules/postgresql/create-postgresql-user.sh',
    require => Package['postgresql']
  }

  file { '/home/apollon/scripts/create-extension-adminpack.sql':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/sql/create-extension-adminpack.sql',
    require => Package['postgresql']
  }

  file { '/home/apollon/scripts/create-extension-postgis.sql':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/sql/create-extension-postgis.sql',
    require => Package['postgresql']
  }

  exec { 'create-extension-postgis':
    user => 'postgres',
    require => [
    File['/home/apollon/scripts/create-extension-postgis.sql'],
    Service['postgresql']
    ],
    command => '/usr/bin/psql -f /home/apollon/scripts/create-extension-postgis.sql'
  }

  exec { 'add-apollon-postgresql-user':
    user => 'postgres',
    require => Service['postgresql'],
    command => '/home/apollon/scripts/create-postgresql-user.sh'
  }

  exec { 'restart-postgresql-after-adding-apollon-user':
    require => Exec['add-apollon-postgresql-user'],
    command => '/usr/sbin/service postgresql restart'
  }

  exec { 'updatedb':
    user => 'root',
    require => [
      Package['postgresql-contrib'],
      Service['postgresql'],
    ],
    command => '/usr/bin/updatedb'
  }

  exec { 'create-extension-adminpack':
    user => 'postgres',
    require => [
      File['/home/apollon/scripts/create-extension-adminpack.sql'],
      Service['postgresql'],
      Exec['updatedb']
    ],
    command => '/usr/bin/psql -f /home/apollon/scripts/create-extension-adminpack.sql'
  }
}
