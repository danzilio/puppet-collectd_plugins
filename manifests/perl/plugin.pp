#
define collectd_plugin::perl::plugin (
  $module,
  $enable_debugger = false,
  $include_dir = false,
  $provider = false,
  $source = false,
  $destination = false,
  $order = '01',
  $config = {},
) {

  if ! defined(Class['Collectd::Plugin::Perl']) {
    include collectd_plugin::perl
  }

  validate_hash($config)
  validate_re($order, '\d+')
  if $enable_debugger {
    validate_string($enable_debugger)
  }
  if $include_dir {
    if is_string($include_dir) {
      $include_dirs = [ $include_dir ]
    } elsif is_array($include_dir) {
      $include_dirs = $include_dir
    } else {
      fail("include_dir must be either array or string: ${include_dir}")
    }
  } else {
    $include_dirs = []
  }

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  $base_filename = $collectd_plugin::perl::filename
  $filename = "${conf_dir}/perl/plugin-${order}_${name}.conf"

  file { $filename:
    group   => $root_group,
    mode    => '0644',
    content => template('collectd_plugins/plugin/perl/plugin.erb'),
  }

  case $provider {
    'package': {
      validate_string($source)
      package { $source:
        require => Collectd::Plugin['perl'],
      }
    }
    'cpan': {
      validate_string($source)
      include cpan
      cpan { $source:
        require => Collectd::Plugin['perl'],
      }
    }
    'file': {
      validate_string($source)
      validate_string($destination)
      file { "collectd_plugin_perl_${name}.pm":
        path    => "${destination}/${module}.pm",
        mode    => '0644',
        source  => $source,
        require => Collectd::Plugin['perl'],
      }
    }
    false: {
      # this will fail if perl collectd plugin module is not installed
      $include_dirs_prefixed = prefix($include_dirs, '-I')
      $include_dirs_prefixed_joined = join($include_dirs_prefixed,' ')
      exec { "perl ${include_dirs_prefixed_joined} -e 'my\$m=shift;eval\"use \$m\";exit!exists\$INC{\$m=~s!::!/!gr.\".pm\"}' ${module}":
        path => $::path
      }
    }
    default: {
      fail("Unsupported provider: ${provider}. Use 'package', 'cpan',
        'file' or false.")
    }
  }
}
