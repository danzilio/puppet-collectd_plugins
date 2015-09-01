# https://collectd.org/wiki/index.php/Plugin:GenericJMX
define collectd_plugin::genericjmx::mbean (
  $object_name,
  $values,
  $instance_prefix = undef,
  $instance_from = undef,
) {
  include collectd_plugin::genericjmx
  validate_array($values)

  concat::fragment {
    "collectd_plugin_genericjmx_conf_${name}":
      order   => '10',
      content => template('collectd/plugin/genericjmx/mbean.conf.erb'),
      target  => $collectd_plugin::genericjmx::config_file;
  }
}
