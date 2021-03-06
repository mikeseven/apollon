# == Class: memcache
#
# Installs Memcached and sets config file.
#
class memcache {
  require core

  package { 'memcached':
    ensure => present;
  }

  service { 'memcached':
    ensure  => running,
    require => Package['memcached'];
  }

  file { '/etc/memcached.conf':
    owner => root,
    group => root,
    source  => 'puppet:///modules/memcache/memcached.conf',
    require => Package['memcached'],
    notify  => Service['memcached'];
  }
}
