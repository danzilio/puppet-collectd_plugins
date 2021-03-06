# https://collectd.org/wiki/index.php/Plugin:Java
class collectd_plugin::java (
  $ensure   = present,
  $jvmarg   = [],
  $interval = undef,
) {
  collectd::plugin { 'java':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/java.conf.erb'),
    interval => $interval,
  }
}
