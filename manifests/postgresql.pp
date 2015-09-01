# https://collectd.org/wiki/index.php/Plugin:PostgreSQL
class collectd_plugin::postgresql (
  $ensure    = present,
  $databases = { },
  $interval  = undef,
  $queries   = { },
  $writers   = { },
) {

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  if $::osfamily == 'Redhat' {
    package { 'collectd-postgresql':
      ensure => $ensure,
    }
  }

  collectd::plugin {'postgresql':
    ensure   => $ensure,
    interval => $interval,
  }

  concat{"${conf_dir}/postgresql-config.conf":
    ensure         => $ensure,
    mode           => '0640',
    owner          => 'root',
    group          => $root_group,
    notify         => Class['collectd::service'],
    ensure_newline => true,
  }
  concat::fragment{'collectd_plugin_postgresql_conf_header':
    order   => '00',
    content => '<Plugin postgresql>',
    target  => "${conf_dir}/postgresql-config.conf",
  }
  concat::fragment{'collectd_plugin_postgresql_conf_footer':
    order   => '99',
    content => '</Plugin>',
    target  => "${conf_dir}/postgresql-config.conf",
  }

  $defaults = {
    'ensure' => $ensure
  }
  create_resources(collectd_plugin::postgresql::database, $databases, $defaults)
  create_resources(collectd_plugin::postgresql::query, $queries, $defaults)
  create_resources(collectd_plugin::postgresql::writer, $writers, $defaults)
}
