# See http://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ping
define collectd_plugin::ping (
  $hosts,
  $ensure         = present,
  $interval       = undef,
  $timeout        = undef,
  $ttl            = undef,
  $source_address = undef,
  $device         = undef,
  $max_missed     = undef,
) {

  validate_array($hosts)

  if $::osfamily == 'Redhat' {
    package { 'collectd-ping':
      ensure => $ensure,
    }
  }

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  file {
    "${name}.load":
      path    => "${conf_dir}/ping-${name}.conf",
      owner   => 'root',
      group   => $root_group,
      mode    => '0644',
      content => template('collectd_plugins/ping.conf.erb'),
      notify  => Class['collectd::service'],
  }
}
