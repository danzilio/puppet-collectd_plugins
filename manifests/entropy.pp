# https://collectd.org/wiki/index.php/Plugin:Entropy
class collectd_plugin::entropy (
  $ensure   = present,
  $interval = undef,
) {

  collectd::plugin {'entropy':
    ensure   => $ensure,
    interval => $interval,
  }
}
