define collectd_plugin::exec::cmd (
  $user,
  $group,
  $exec              = [],
  $notification_exec = [],
  $ensure = present,
) {

  include collectd_plugin::exec

  validate_array($exec)
  validate_array($notification_exec)

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  # This is deprecated file naming ensuring old style file removed, and should be removed in next major relese
  file { "${name}.load-deprecated":
    ensure => absent,
    path   => "${conf_dir}/${name}.conf",
  }
  # End deprecation

  concat::fragment{"collectd_plugin_exec_conf_${title}":
    ensure  => $ensure,
    order   => '50', # somewhere between header and footer
    target  => $collectd_plugin::exec::exec_conf,
    content => template('collectd_plugins/plugin/exec/cmd.conf.erb'),
  }
}
