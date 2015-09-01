#
define collectd_plugin::postgresql::query (
  $ensure     = 'present',
  $statement  = undef,
  $params     = [],
  $results    = [{}],
  $minversion = undef,
  $maxversion = undef,
){

  include collectd_plugin::postgresql

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  validate_string($statement)
  validate_array($params, $results)

  concat::fragment{"collectd_plugin_postgresql_conf_query_${title}":
    ensure  => $ensure,
    order   => '30',
    target  => "${conf_dir}/postgresql-config.conf",
    content => template('collectd/plugin/postgresql/query.conf.erb'),
  }
}
