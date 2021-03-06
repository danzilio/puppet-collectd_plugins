# https://collectd.org/wiki/index.php/Plugin:AMQP
class collectd_plugin::amqp (
  $ensure          = present,
  $amqphost        = 'localhost',
  $amqpport        = 5672,
  $amqpvhost       = 'graphite',
  $amqpuser        = 'graphite',
  $amqppass        = 'graphite',
  $amqpformat      = 'Graphite',
  $amqpexchange    = 'metrics',
  $amqppersistent  = true,
  $graphiteprefix  = 'collectd.',
  $escapecharacter = '_',
  $interval        = undef,
) {

  validate_bool($amqppersistent)

  if $::osfamily == 'Redhat' {
    package { 'collectd-amqp':
      ensure => $ensure,
    }
  }

  collectd::plugin {'amqp':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/amqp.conf.erb'),
    interval => $interval,
  }
}
