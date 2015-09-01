# https://collectd.org/wiki/index.php/Plugin:SNMP
define collectd_plugin::snmp::host (
  $collect,
  $ensure = present,
  $address = $name,
  $version = '1',
  $community = 'public',
  $interval = undef,
) {

  include collectd_plugin::snmp

  validate_re($version, '^[12]$', 'only snmp versions 1 and 2 are supported')

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  file { "snmp-host-${name}.conf":
    ensure  => $ensure,
    path    => "${conf_dir}/25-snmp-host-${name}.conf",
    owner   => 'root',
    group   => $root_group,
    mode    => '0640',
    content => template('collectd/plugin/snmp/host.conf.erb'),
    notify  => Class['collectd::service'];
  }
}
