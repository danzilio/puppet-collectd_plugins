# https://collectd.org/wiki/index.php/Plugin:NFS
class collectd_plugin::nfs (
  $ensure   = present,
  $interval = undef,
) {
  collectd::plugin {'nfs':
    ensure   => $ensure,
    interval => $interval,
  }
}
