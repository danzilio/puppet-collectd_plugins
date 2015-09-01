# Tail plugin
# https://collectd.org/wiki/index.php/Plugin:Tail
class collectd_plugin::tail (
  $interval = undef,
){
  collectd::plugin { 'tail':
    interval => $interval,
  }
}

