#
define collectd_plugin::postgresql::writer (
  $ensure     = 'present',
  $statement  = undef,
  $storerates = undef,
){

  include collectd_plugin::postgresql

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  validate_string($statement)

  concat::fragment{"collectd_plugin_postgresql_conf_writer_${title}":
    ensure  => $ensure,
    order   => '40',
    target  => "${conf_dir}/postgresql-config.conf",
    content => template('collectd/plugin/postgresql/writer.conf.erb'),
  }
}
