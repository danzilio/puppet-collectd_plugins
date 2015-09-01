# Single module definition
define collectd_plugin::python::module (
  $config,
  $modulepath    = undef,
  $script_source = undef,
  $module        = $title,
  $ensure        = 'present',
){

  include collectd_plugin::python

  $root_group = getparam(Class['collectd'], 'root_group')

  validate_hash($config)

  $module_dir = $modulepath ? {
    undef   => $collectd::params::python_dir,
    default => $modulepath
  }
  validate_absolute_path($module_dir)

  if $script_source {
    file { "${module}.script":
      ensure  => $ensure,
      path    => "${module_dir}/${module}.py",
      owner   => 'root',
      group   => $root_group,
      mode    => '0640',
      source  => $script_source,
      require => File[$module_dir],
      notify  => Class['collectd::service'],
    }
  }

  concat::fragment{"collectd_plugin_python_conf_${module}":
    ensure  => $ensure,
    order   => '50', # somewhere between header and footer
    target  => $collectd_plugin::python::python_conf,
    content => template('collectd_plugins/plugin/python/module.conf.erb'),
  }
}
