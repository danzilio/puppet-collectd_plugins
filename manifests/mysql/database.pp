#
define collectd_plugin::mysql::database (
  $ensure      = 'present',
  $database    = $name,
  $host        = 'UNSET',
  $username    = 'UNSET',
  $password    = 'UNSET',
  $port        = '3306',
  $masterstats = false,
  $slavestats  = false,
  $socket      = undef,
) {

  include collectd_plugin::mysql

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_string($database, $host, $username, $password, $port)
  validate_bool($masterstats, $slavestats)
  if $socket {
    validate_string($socket)
  }

  if ($masterstats == true and $slavestats == true) {
    fail('master and slave statistics are mutually exclusive.')
  }

  file { "${name}.conf":
    ensure  => $ensure,
    path    => "${conf_dir}/mysql-${name}.conf",
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd/mysql-database.conf.erb'),
    notify  => Class['collectd::service'],
  }
}
