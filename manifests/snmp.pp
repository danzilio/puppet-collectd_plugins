# https://collectd.org/wiki/index.php/Plugin:SNMP
class collectd_plugin::snmp (
  $ensure   = present,
  $data     = {},
  $hosts    = {},
  $interval = undef,
) {
  if $::osfamily == 'Redhat' {
    package { 'collectd-snmp':
      ensure => $ensure,
    }
  }

  collectd::plugin {'snmp':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/snmp.conf.erb'),
    interval => $interval,
  }
}
