#
define collectd_plugin::curl::page (
  $ensure              = 'present',
  $url                 = undef,
  $user                = undef,
  $password            = undef,
  $verifypeer          = undef,
  $verifyhost          = undef,
  $cacert              = undef,
  $header              = undef,
  $post                = undef,
  $measureresponsetime = undef,
  $matches             = undef,
  $plugininstance      = $name, # You can have multiple <Page> with the same name.
) {

  include collectd_plugin::curl

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_string($url)

  if $matches != undef {
    validate_array($matches)
  }

  file { "${conf_dir}/curl-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $root_group,
    content => template('collectd/plugin/curl-page.conf.erb'),
    notify  => Service['collectd'],
  }
}
