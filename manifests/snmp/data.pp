# https://collectd.org/wiki/index.php/Plugin:SNMP
define collectd_plugin::snmp::data (
  $instance,
  $type,
  $values,
  $ensure = present,
  $table = false,
) {

  include collectd_plugin::snmp

  $table_bool = str2bool($table)

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  file { "snmp-data-${name}.conf":
    ensure  => $ensure,
    path    => "${conf_dir}/15-snmp-data-${name}.conf",
    owner   => 'root',
    group   => $root_group,
    mode    => '0640',
    content => template('collectd/plugin/snmp/data.conf.erb'),
    notify  => Class['collectd::service'];
  }
}
