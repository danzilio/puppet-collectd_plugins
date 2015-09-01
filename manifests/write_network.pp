# A define to make a generic network output for collectd
class collectd_plugin::write_network (
  $ensure  = 'present',
  $servers = { 'localhost'  =>  { 'serverport' => '25826' } },
) {

  warning('Deprecated. This class may be removed in the future. Use collectd_plugin::network instead.')

  validate_hash($servers)

  $servernames = keys($servers)
  if empty($servernames) {
    fail('servers cannot be empty')
  }
  $servername = $servernames[0]
  $serverport = $servers[$servername]['serverport']

  class { 'collectd_plugin::network':
    server     => $servername,
    serverport => $serverport,
  }
}
