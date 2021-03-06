# https://collectd.org/wiki/index.php/Target:v5_upgrade
class collectd_plugin::target_v5upgrade (
  $ensure = present,
) {
  collectd::plugin {'target_v5upgrade':
    ensure  => $ensure,
    content => template('collectd_plugins/plugin/target_v5upgrade.conf.erb'),
    order   => '06',
  }
}
