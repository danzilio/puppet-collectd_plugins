# https://collectd.org/wiki/index.php/Plugin:Write_Riemann
class collectd_plugin::write_riemann (
  $ensure           = present,
  $riemann_host     = 'localhost',
  $riemann_port     = 5555,
  $protocol         = 'UDP',
  $store_rates      = false,
  $always_append_ds = false,
  $interval         = undef,
) {
  validate_bool($store_rates)
  validate_bool($always_append_ds)

  if $::osfamily == 'Redhat' {
    package { 'collectd-write_riemann':
      ensure => $ensure,
    }
  }

  collectd::plugin {'write_riemann':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/write_riemann.conf.erb'),
    interval => $interval,
  }
}
