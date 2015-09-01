# https://collectd.org/wiki/index.php/Plugin:ConnTrack
class collectd_plugin::conntrack (
  $ensure = present,
) {
  collectd::plugin {'conntrack':
    ensure => $ensure
  }
}
