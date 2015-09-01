# https://collectd.org/wiki/index.php/Plugin:CPUFreq
class collectd_plugin::cpufreq (
  $ensure = present,
) {
  collectd::plugin {'cpufreq':
    ensure => $ensure
  }
}
