#
define collectd_plugin::network::server (
  $ensure        = 'present',
  $username      = undef,
  $password      = undef,
  $port          = undef,
  $securitylevel = undef,
  $interface     = undef,
  $forward       = undef,
) {

  include collectd_plugin::network

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_string($name)

  file { "${conf_dir}/network-server-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd/plugin/network/server.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
