# https://collectd.org/wiki/index.php/Plugin:GenericJMX
define collectd_plugin::genericjmx::connection (
  $collect,
  $service_url,
  $host = $name,
  $user = undef,
  $password = undef,
  $instance_prefix = undef,
) {
  include collectd_plugin::genericjmx
  concat::fragment { "collectd_plugin_genericjmx_conf_${name}":
    order   => 20,
    content => template('collectd_plugins/plugin/genericjmx/connection.conf.erb'),
    target  => $collectd_plugin::genericjmx::config_file;
  }
}
