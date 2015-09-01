# databasename allows you to create <Database> blocks with the same name of database,
# useful if you have multiple instances of different version of pg
define collectd_plugin::postgresql::database (
  $ensure       = 'present',
  $host         = undef,
  $databasename = $name,
  $port         = undef,
  $user         = undef,
  $password     = undef,
  $sslmode      = undef,
  $query        = [],
  $interval     = undef,
  $instance     = undef,
  $krbsrvname   = undef,
  $writer       = undef,
  $service      = undef,
){

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  include collectd_plugin::postgresql

  concat::fragment{"collectd_plugin_postgresql_conf_db_${title}":
    ensure  => $ensure,
    order   => '50',
    target  => "${conf_dir}/postgresql-config.conf",
    content => template('collectd_plugins/plugin/postgresql/database.conf.erb'),
  }
}
