# https://collectd.org/wiki/index.php/Plugin:FileCount
define collectd_plugin::filecount::directory (
  $ensure       = present,
  $instance     = $name,
  $path         = undef,
  $pattern      = undef,
  $mtime        = undef,
  $size         = undef,
  $recursive     = undef,
  $includehidden = undef
) {

  include collectd_plugin::filecount

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_string($path)

  file { "${conf_dir}/15-filecount-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd/plugin/filecount-directory.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
