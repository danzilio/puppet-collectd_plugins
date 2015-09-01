# https://collectd.org/wiki/index.php/Plugin:LVM
class collectd_plugin::lvm (
  $ensure   = present,
  $interval = undef,
) {

  if $::osfamily == 'Redhat' {
    package { 'collectd-lvm':
      ensure => $ensure,
    }
  }

  collectd::plugin {'lvm':
    ensure   => $ensure,
    interval => $interval,
  }
}
