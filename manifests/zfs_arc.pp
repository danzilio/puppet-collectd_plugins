# https://collectd.org/wiki/index.php/Plugin:ZFS_ARC
class collectd_plugin::zfs_arc (
  $ensure = present,
) {
  collectd::plugin {'zfs_arc':
    ensure => $ensure
  }
}
