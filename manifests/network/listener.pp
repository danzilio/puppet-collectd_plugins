#
define collectd_plugin::network::listener (
  $ensure        = 'present',
  $authfile      = undef,
  $port          = undef,
  $securitylevel = undef,
  $interface     = undef,
) {

  include collectd_plugin::network

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_string($name)

  file { "${conf_dir}/network-listener-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd_plugins/plugin/network/listener.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
