# == Class: logstash_reporter::params
#
# This class exists to
# 1. Declutter the default value assignment for class parameters.
# 2. Manage internally used module variables in a central place.
#
# Therefore, many operating system dependent differences (names, paths, ...)
# are addressed in here.
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Examples
#
# This class is not intended to be used directly.
#
#
# === Links
#
# * {Puppet Docs: Using Parameterized Classes}[http://j.mp/nVpyWY]
#
#
# === Authors
#
# * Richard Pijnenburg <mailto:richard.pijnenburg@elastic.co>
#
class logstash_reporter::params {

  if( $::is_pe == true ) {
    $config_file = '/etc/puppetlabs/puppet/logstash.yaml'
    $config_owner = 'pe-puppet'
    $config_group = 'pe-puppet'
  } elsif versioncmp($::puppetversion, '4.0.0') >= 0 {
      if $::pe_server_version {
        $config_owner = 'pe-puppet'
        $config_group = 'pe-puppet'
      }
      else {
        $config_owner = 'puppet'
        $config_group = 'puppet'
      }
    $config_file = '/etc/puppetlabs/puppet/logstash.yaml'
  } else {
    $config_file = '/etc/puppet/logstash.yaml'
    $config_owner = 'puppet'
    $config_group = 'puppet'
  }

}
