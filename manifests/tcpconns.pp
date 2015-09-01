# https://collectd.org/wiki/index.php/Plugin:TCPConns
class collectd_plugin::tcpconns (
  $localports  = undef,
  $remoteports = undef,
  $listening   = undef,
  $interval    = undef,
  $ensure      = present
) {

  if $localports {
    validate_array($localports)
  }

  if $remoteports {
    validate_array($remoteports)
  }

  collectd::plugin {'tcpconns':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/tcpconns.conf.erb'),
    interval => $interval,
  }
}
