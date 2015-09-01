# https://collectd.org/wiki/index.php/Plugin:Network
class collectd_plugin::network (
  $ensure        = present,
  $timetolive    = undef,
  $maxpacketsize = undef,
  $forward       = undef,
  $interval      = undef,
  $reportstats   = undef,
  $listeners     = { },
  $servers       = { },
) {
  if $timetolive {
    validate_re($timetolive, '[0-9]+')
  }
  if $maxpacketsize {
    validate_re($maxpacketsize, '[0-9]+')
  }

  collectd::plugin {'network':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/network.conf.erb'),
    interval => $interval,
  }
  $defaults = {
    'ensure' => $ensure
  }
  create_resources(collectd_plugin::network::listener, $listeners, $defaults)
  create_resources(collectd_plugin::network::server, $servers, $defaults)
}
