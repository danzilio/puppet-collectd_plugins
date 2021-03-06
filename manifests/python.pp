# See http://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_python
class collectd_plugin::python (
  $modulepaths = [],
  $ensure      = present,
  $modules     = {},
  # Unlike most other plugins, this one should set "Globals true". This will cause collectd
  # to export the name of all objects in the Python interpreter for all plugins to see.
  $globals     = true,
  $order       = '10',
  $interval    = undef,
  # Python 2 defaults to 'ascii' and Python 3 to 'utf-8'
  $encoding    = undef,
  $interactive = false,
  $logtraces   = false,
) {

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_hash($modules)
  validate_bool($interactive)
  validate_bool($logtraces)
  validate_bool($globals)
  validate_array($modulepaths)

  $module_dirs = empty($modulepaths) ? {
    true  => [$collectd::params::python_dir],
    # use paths provided by the user
    false => $modulepaths
  }

  collectd::plugin {'python':
    ensure   => $ensure,
    interval => $interval,
    order    => $order,
    globals  => $globals,
  }

  $ensure_modulepath = $ensure ? {
    'absent' => $ensure,
    default  => 'directory',
  }

  ensure_resource('file', $module_dirs,
    {
      'ensure'  => $ensure_modulepath,
      'mode'    => '0750',
      'owner'   => 'root',
      'group'   => $root_group,
      'require' => Class['collectd']
    }
  )

  # should be loaded after global plugin configuration
  $python_conf = "${conf_dir}/python-config.conf"

  concat{ $python_conf:
    ensure         => $ensure,
    mode           => '0640',
    owner          => 'root',
    group          => $root_group,
    notify         => Class['collectd::service'],
    ensure_newline => true,
  }

  concat::fragment{'collectd_plugin_python_conf_header':
    order   => '00',
    content => template('collectd_plugins/plugin/python/header.conf.erb'),
    target  => $python_conf,
  }

  concat::fragment{'collectd_plugin_python_conf_footer':
    order   => '99',
    content => '</Plugin>',
    target  => $python_conf,
  }

  $defaults = {
    'ensure'     => $ensure,
    'modulepath' => $module_dirs[0],
  }
  create_resources(collectd_plugin::python::module, $modules, $defaults)
}
