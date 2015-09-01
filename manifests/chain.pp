#
class collectd_plugin::chain (
  $chainname     = 'Main',
  $ensure        = 'present',
  $defaulttarget = 'write',
  $rules         = []
) {

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  file { "${conf_dir}/99-chain-${chainname}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd_plugins/plugin/chain.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
