#
define collectd_plugin::tail::file (
  $filename,
  $instance,
  $matches,
  $ensure = 'present',
) {

  include collectd_plugin::tail

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  validate_absolute_path($filename)
  validate_string($instance)
  validate_array($matches)
  validate_hash($matches[0])

  file { "${name}.conf":
    ensure  => $ensure,
    path    => "${conf_dir}/tail-${name}.conf",
    mode    => '0644',
    owner   => 'root',
    group   => $collectd::params::root_group,
    content => template('collectd/tail-file.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
