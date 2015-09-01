# See http://collectd.org/documentation/manpages/collectd-perl.5.shtml
class collectd_plugin::perl (
  $ensure   = present,
  $interval = undef,
  $order    = 20
)
{

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  if $::osfamily == 'Redhat' {
    package { 'collectd-perl':
      ensure => $ensure,
    }
  }

  collectd::plugin { 'perl':
    ensure   => $ensure,
    globals  => true,
    interval => $interval,
    order    => $order,
    content  => template('collectd/plugin/perl.conf.erb'),
  }

  file { "${conf_dir}/perl":
    ensure => directory,
    mode   => '0755',
    group  => $root_group,
  }
}
