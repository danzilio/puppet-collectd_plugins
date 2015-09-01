#
define collectd_plugin::aggregation::aggregator (
  $ensure            = 'present',
  $host              = undef,
  $plugin            = undef,
  $plugininstance    = undef,
  $type              = undef,
  $typeinstance      = undef,
  $sethost           = undef,
  $setplugin         = undef,
  $setplugininstance = undef,
  $settypeinstance   = undef,
  $groupby           = [],
  $calculatesum      = undef,
  $calculatenum      = undef,
  $calculateaverage  = undef,
  $calculateminimum  = undef,
  $calculatemaximum  = undef,
  $calculatestddev   = undef,
) {

  include collectd_plugin::aggregation

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  file { "${conf_dir}/aggregator-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd/plugin/aggregation-aggregator.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
