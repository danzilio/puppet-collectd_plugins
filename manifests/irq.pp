# https://collectd.org/wiki/index.php/Plugin:IRQ
class collectd_plugin::irq (
  $ensure         = present,
  $irqs           = [],
  $ignoreselected = false,
  $interval       = undef,
) {
  validate_array($irqs)
  validate_bool($ignoreselected)

  collectd::plugin {'irq':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/irq.conf.erb'),
    interval => $interval,
  }
}
