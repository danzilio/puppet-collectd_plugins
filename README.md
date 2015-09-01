# `collectd_plugins`
This is a community-maintained collection of plugin configurations for `collectd` based on the [collectd](https://github.com/puppet-community/puppet-collectd) module.

# Configurable Plugins

Parameters will vary widely between plugins. See the collectd
documentation for each plugin for configurable attributes.

* `aggregation`  (see [collectd_plugin::aggregation](#class-collectdpluginaggregation) below)
* `amqp`  (see [collectd_plugin::amqp](#class-collectdpluginamqp) below)
* `apache`  (see [collectd_plugin::apache](#class-collectdpluginapache) below)
* `bind`  (see [collectd_plugin::bind](#class-collectdpluginbind) below)
* `chain`  (see [collectd_plugin::chain](#class-chain) below)
* `conntrack`  (see [collectd_plugin::conntrack](#class-conntrack) below)
* `cpu`  (see [collectd_plugin::cpu](#class-collectdplugincpu) below)
* `cpufreq`  (see [collectd_plugin::cpufreq](#class-collectdplugincpufreq) below)
* `csv`  (see [collectd_plugin::csv](#class-collectdplugincsv) below)
* `curl` (see [collectd_plugin::curl](#class-collectdplugincurl) below)
* `curl_json` (see [collectd_plugin::curl_json](#class-collectdplugincurl_json) below)
* `df`  (see [collectd_plugin::df](#class-collectdplugindf) below)
* `disk` (see [collectd_plugin::disk](#class-collectdplugindisk) below)
* `entropy`  (see [collectd_plugin::entropy](#class-collectdpluginentropy) below)
* `exec`  (see [collectd_plugin::exec](#class-collectdpluginexec) below)
* `filecount` (see [collectd_plugin::filecount](#class-collectdpluginfilecount) below)
* `genericjmx` (see [collectd_plugin::genericjmx](#class-collectdplugingenericjmx) below)
* `interface` (see [collectd_plugin::interface](#class-collectdplugininterface) below)
* `iptables` (see [collectd_plugin::iptables](#class-collectdpluginiptables) below)
* `irq` (see [collectd_plugin::irq](#class-collectdpluginirq) below)
* `java` (see [collectd_plugin::java](#class-collectdpluginjava) below)
* `load` (see [collectd_plugin::load](#class-collectdpluginload) below)
* `logfile` (see [collectd_plugin::logfile](#class-collectdpluginlogfile) below)
* `libvirt` (see [collectd_plugin::libvirt](#class-collectdpluginlibvirt) below)
* `lvm` (see [collectd_plugin::lvm](#class-collectdpluginlvm) below)
* `memcached`(see [collectd_plugin::memcached](#class-collectdpluginmemcached) below )
* `memory`(see [collectd_plugin::memory](#class-collectdpluginmemory) below )
* `mysql` (see [collectd_plugin::mysql](#class-collectdpluginmysql) below)
* `network` (see [collectd_plugin::network](#class-collectdpluginnetwork) below)
* `nfs`  (see [collectd_plugin::nfs](#class-collectdpluginnfs) below)
* `nginx` (see [collectd_plugin::nginx](#class-collectdpluginnginx) below)
* `ntpd` (see [collectd_plugin::ntpd](#class-collectdpluginntpd) below)
* `openvpn` (see [collectd_plugin::openvpn](#class-collectdpluginopenvpn) below)
* `perl` (see [collectd_plugin::perl](#class-collectdpluginperl) below)
* `ping` (see [collectd_plugin::ping](#class-collectdpluginping) below)
* `postgresql` (see [collectd_plugin::postgresql](#class-collectdpluginpostgresql) below)
* `processes` (see [collectd::plugin:processes](#class-collectdpluginprocesses) below)
* `protocols` (see [collectd::plugin:protocols](#class-collectdpluginprotocols) below)
* `python` (see [collectd_plugin::python](#class-collectdpluginpython) below)
* `redis` (see [collectd_plugin::redis](#class-collectdpluginredis) below)
* `rrdcached` (see [collectd_plugin::rrdcached](#class-collectdpluginrrdcached) below)
* `rrdtool` (see [collectd_plugin::rrdtool](#class-collectdpluginrrdtool) below)
* `sensors` (see [collectd_plugin::sensors](#class-collectdpluginsensors) below)
* `snmp` (see [collectd_plugin::snmp](#class-collectdpluginsnmp) below)
* `statsd` (see [collectd_plugin::statsd](#class-collectdpluginstatsd) below)
* `swap` (see [collectd_plugin::swap](#class-collectdpluginswap) below)
* `syslog` (see [collectd_plugin::syslog](#class-collectdpluginsyslog) below)
* `tail` (see [collectd_plugin::tail](#class-collectdplugintail) below)
* `target_v5upgrade` (see [collectd_plugin::target_v5upgrade](#class-collectdplugintarget_v5upgrade) below)
* `tcpconns` (see [collectd_plugin::tcpconns](#class-collectdplugintcpconns) below)
* `unixsock` (see [collectd_plugin::unixsock](#class-collectdpluginunixsock) below)
* `uptime` (see [collectd_plugin::uptime](#class-collectdpluginuptime) below)
* `users` (see [collectd_plugin::users](#class-collectdpluginusers) below)
* `varnish` (see [collectd_plugin::varnish](#class-collectdpluginvarnish) below)
* `vmem` (see [collectd_plugin::vmem](#class-collectdpluginvmem) below)
* `write_graphite` (see [collectd_plugin::write_graphite](#class-collectdpluginwrite_graphite) below)
* `write_http` (see [collectd_plugin::write_http](#class-collectdpluginwrite_http) below)
* `write_network` (see [collectd_plugin::write_network](#class-collectdpluginwrite_network) below)
* `write_riemann` (see [collectd_plugin::write_riemann](#class-collectdpluginwrite_riemann) below)
* `zfs_arc` (see [collectd_plugin::zfs_arc](#class-collectdpluginzfs_arc) below)

####Class: `collectd_plugin::aggregation`

```puppet
collectd_plugin::aggregation::aggregator {
  cpu':
    plugin           => 'cpu',
    type             => 'cpu',
    groupby          => ["Host", "TypeInstance",],
    calculateaverage => true,
}
```

You can as well configure this plugin with a parameterized class :

```puppet
class { 'collectd_plugin::aggregation':
  aggregators => {
    cpu' => {
      plugin           => 'cpu',
      type             => 'cpu',
      groupby          => ["Host", "TypeInstance",],
      calculateaverage => true,
    },
  },
}
```

####Class: `collectd_plugin::amqp`

```puppet
class { 'collectd_plugin::amqp':
  amqphost => '127.0.0.1',
  amqpvhost => 'myvirtualhost',
  graphiteprefix => 'collectdmetrics',
  amqppersistent => true,
}
```

####Class: `collectd_plugin::apache`

```puppet
class { 'collectd_plugin::apache':
  instances => {
    'apache80' => {
      'url' => 'http://localhost/mod_status?auto', 'user' => 'collectd', 'password' => 'hoh2Coo6'
    },
    'lighttpd8080' => {
      'url' => 'http://localhost:8080/mod_status?auto'
    }
  },
}
```

####Class: `collectd_plugin::bind`

```puppet
class { 'collectd_plugin::bind':
  url    => 'http://localhost:8053/',
}
```

####Class: `collectd_plugin::chain`

```puppet
class { 'collectd_plugin::chain':
    chainname     => "PostCache",
    defaulttarget => "write",
    rules         => [
      {
        'match'   => {
          'type'    => 'regex',
          'matches' => {
            'Plugin'         => "^cpu$",
            'PluginInstance' => "^[0-9]+$",
          },
        },
        'targets' => [
          {
            'type'       => "write",
            'attributes' => {
              "Plugin" => "aggregation",
            },
          },
          {
            'type' => "stop",
          },
        ],
      },
    ],
  }
```

####Class: `collectd_plugin::conntrack`

```puppet
class { 'collectd_plugin::conntrack':
}


```

####Class: `collectd_plugin::cpu`

 * `reportbystate` available from collectd version >= 5.5
 * `reportbycpu` available from collectd version >= 5.5
 * `valuespercentage` available from collectd version >= 5.5

 See [collectd plugin_cpu documentation](https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cpu) for more details.

```puppet
class { 'collectd_plugin::cpu':
  reportbystate => true,
  reportbycpu => true,
  valuespercentage => true,
}


```
####Class: `collectd_plugin::cpufreq`

```puppet
class { 'collectd_plugin::cpufreq':
}
```

####Class: `collectd_plugin::csv`

```puppet
class { 'collectd_plugin::csv':
  datadir    => '/etc/collectd/var/lib/collectd/csv',
  storerates => false,
}
```

####Class: `collectd_plugin::curl`

```puppet
collectd_plugin::curl::page {
  'stock_quotes':
    url      => 'http://finance.google.com/finance?q=NYSE%3AAMD',
    user     => 'foo',
    password => 'bar',
    matches  => [
      {
        'dstype'   => 'GaugeAverage',
        'instance' => 'AMD',
        'regex'    => ']*> *([0-9]*\\.[0-9]+) *',
        'type'     => 'stock_value',
      }],
}
```

You can as well configure this plugin with a parameterized class :

```puppet
class { 'collectd_plugin::curl':
  pages => {
    'stock_GM' => {
      url      => 'http://finance.google.com/finance?q=NYSE%3AGM',
      user     => 'foo',
      password => 'bar',
      matches  => [
        {
          'dstype'   => 'GaugeAverage',
          'instance' => 'AMD',
          'regex'    => ']*> *([0-9]*\\.[0-9]+) *',
          'type'     => 'stock_value',
        },
      ],
    },
  },
}
```

####Class: `collectd_plugin::curl_json`

```puppet
collectd_plugin::curl_json {
  'rabbitmq_overview':
    url => 'http://localhost:55672/api/overview',
    instance => 'rabbitmq_overview',
    keys => {
      'message_stats/publish' => {'type' => 'gauge'},
    }
}
```

####Class: `collectd_plugin::df`

```puppet
class { 'collectd_plugin::df':
  mountpoints    => ['/u'],
  fstypes        => ['nfs','tmpfs','autofs','gpfs','proc','devpts'],
  ignoreselected => true,
}
```

####Class: `collectd_plugin::disk`

```puppet
class { 'collectd_plugin::disk':
  disks          => ['/^dm/'],
  ignoreselected => true,
  udevnameattr   => 'DM_NAME',
}
```

####Class: `collectd_plugin::entropy`

```puppet
class { 'collectd_plugin::entropy':
}
```

####Class: `collectd_plugin::exec`

```puppet
collectd_plugin::exec::cmd {
  'dummy':
    user => nobody,
    group => nogroup,
    exec => ["/bin/echo", "PUTVAL myhost/foo/gauge-flat N:1"],
}

```
You can also configure this plugin with a parameterized class:
```puppet
class { 'collectd_plugin::exec':
  commands => {
    'dummy1' => {
      user  => nobody,
      group => nogroup,
      exec  => ["/bin/echo", "PUTVAL myhost/foo/gauge-flat1 N:1"],
    },
    'dummy2' => {
      user  => nobody,
      group => nogroup,
      exec  => ["/bin/echo", "PUTVAL myhost/foo/gauge-flat2 N:1"],
    },
  }
}
```

####Class: `collectd_plugin::filecount`

```puppet
collectd_plugin::filecount::directory {'foodir':
  path          => '/path/to/dir',
  pattern       => '*.conf',
  mtime         => '-5m',
  recursive     => true,
  includehidden => false
}

```
You can also configure this plugin with a parameterized class:
```puppet
class { 'collectd_plugin::filecount':
  directories => {
    'foodir' => {
      'path'          => '/path/to/dir',
      'pattern'       => '*.conf',
      'mtime'         => '-5m',
      'recursive'     => true,
      'includehidden' => false
      },
  },
}
```
For backwards compatibility:
```puppet
class { 'collectd_plugin::filecount':
  directories => {
    'active'   => '/var/spool/postfix/active',
    'incoming' => '/var/spool/postfix/incoming'
  },
}
```

####Class: `collectd_plugin::genericjmx`

```puppet
include collectd_plugin::genericjmx

collectd_plugin::genericjmx::mbean {
  'garbage_collector':
    object_name     => 'java.lang:type=GarbageCollector,*',
    instance_prefix => 'gc-',
    instance_from   => 'name',
    values          => [
      {
        type      => 'invocations',
        table     => false,
        attribute => 'CollectionCount',
      },
      {
        type            => 'total_time_in_ms',
        instance_prefix => 'collection_time',
        table           => false,
        attribute       => 'CollectionTime',
      },
    ];
}

collectd_plugin::genericjmx::connection {
  'java_app':
    host            => $fqdn,
    service_url     => 'service:jmx:rmi:///jndi/rmi://localhost:3637/jmxrmi',
    collect         => [ 'memory-heap', 'memory-nonheap','garbage_collector' ],
}

```

####Class: `collectd_plugin::interface`

```puppet
class { 'collectd_plugin::interface':
  interfaces     => ['lo'],
  ignoreselected => true
}
```

####Class: `collectd_plugin::irq`

```puppet
class { 'collectd_plugin::irq':
  irqs           => ['7', '23'],
  ignoreselected => true,
}
```

####Class: `collectd_plugin::iptables`

```puppet
class { 'collectd_plugin::iptables':
  chains  => {
    'nat'    => 'In_SSH',
    'filter' => 'HTTP'
  },
}
```

####Class: `collectd_plugin::java`

```puppet
class { 'collectd_plugin::java': }
```

####Class: `collectd_plugin::load`

```puppet
class { 'collectd_plugin::load':
}
```

####Class: `collectd_plugin::logfile`

```puppet
class { 'collectd_plugin::logfile':
  log_level => 'warning',
  log_file => '/var/log/collected.log'
}
```

####Class: `collectd_plugin::libvirt`

The interface_format parameter was introduced in collectd 5.0 and will
therefore be ignored (with a warning) when specified with older versions.

```puppet
class { 'collectd_plugin::libvirt':
  connection       => 'qemu:///system',
  interface_format => 'address'
}
```

####Class: `collectd_plugin::lvm`

```puppet
class { 'collectd_plugin::lvm': }
```

####Class: `collectd_plugin::memcached`

```puppet
class { 'collectd_plugin::memcached':
  host => '192.168.122.1',
  port => 11211,
}
```

####Class: `collectd_plugin::memory`

```puppet
class { 'collectd_plugin::memory':
}
```

####Class: `collectd_plugin::mysql`

```puppet
collectd_plugin::mysql::database { 'betadase':
  host        => 'localhost',
  username    => 'stahmna',
  password    => 'secret',
  port        => '3306',
  masterstats => true,
}
```

####Class: `collectd_plugin::network`

```puppet
collectd_plugin::network::server{'hostname':
  port => 25826,
}

collectd_plugin::network::listener{'hostname':
  port => 25826,
}
```

You can as well configure this plugin with a parameterized class :

```puppet
class { 'collectd_plugin::network':
  timetolive    => '70',
  maxpacketsize => '42',
  forward       => false,
  reportstats   => true,
  servers       => { 'hostname' => {
    'port'          => '25826',
    'interface'     => 'eth0',
    'securitylevel' => '',
    'username'      => 'foo',
    'password'      => 'bar',},
  },
  listeners     => { 'hostname' => {
    'port'          => '25826',
    'interface'     => 'eth0',
    'securitylevel' => '',
    'authfile'      => '/etc/collectd/passwd',},
  },
}
```

####Class: `collectd_plugin::nfs`

```puppet
class { 'collectd_plugin::nfs':
}
```

####Class: `collectd_plugin::nginx`

```puppet
class { 'collectd_plugin::nginx':
  url      => 'https://localhost:8433',
  user     => 'stats',
  password => 'uleePi4A',
}
```

####Class: `collectd_plugin::ntpd`

```puppet
class { 'collectd_plugin::ntpd':
  host           => 'localhost',
  port           => 123,
  reverselookups => false,
  includeunitid  => false,
}
```

####Class: `collectd_plugin::openvpn`

 * `statusfile` (String or Array) Status file(s) to collect data from. (Default `/etc/openvpn/openvpn-status.log`)
 * `improvednamingschema` (Bool) When enabled, the filename of the status file will be used as plugin instance and the client's "common name" will be used as type instance. This is required when reading multiple status files. (Default: `false`)
 * `collectcompression` Sets whether or not statistics about the compression used by OpenVPN should be collected. This information is only available in single mode. (Default `true`)
 * `collectindividualusers` Sets whether or not traffic information is collected for each connected client individually. If set to false, currently no traffic data is collected at all because aggregating this data in a save manner is tricky. (Default `true`)
 * `collectusercount` When enabled, the number of currently connected clients or users is collected.  This is especially interesting when CollectIndividualUsers is disabled, but can be configured independently from that option. (Default `false`)

Watch multiple `statusfile`s:

```puppet
class { 'collectd_plugin::openvpn':
  statusfile             => [ '/etc/openvpn/openvpn-status-tcp.log', '/etc/openvpn/openvpn-status-udp.log' ],
  collectindividualusers => false,
  collectusercount       => true,
}
```

Watch the single default `statusfile`:

```puppet
class { 'collectd_plugin::openvpn':
  collectindividualusers => false,
  collectusercount       => true,
}
```


####Class: `collectd_plugin::perl`

This class has no parameters and will load the actual perl plugin.
It will be automatically included if any `perl::plugin` is defined.

#####Example:
```puppet
include collectd_plugin::perl
```

####Define: `collectd_plugin::perl::plugin`

This define will load a new perl plugin.

#####Parameters:

* `module` (String): name of perl module to load (mandatory)
* `enable_debugger` (False or String): whether to load the perl debugger. See *collectd-perl* manpage for more details.
* `include_dir` (String or Array): directories to add to *@INC*
* `provider` (`"package"`,`"cpan"`,`"file"` or `false`): method to get the plugin code
* `source` (String): this parameter is consumed by the provider to infer the source of the plugin code
* `destination (String or false): path to plugin code if `provider` is `file`. Ignored otherwise.
* `order` (String containing numbers): order in which the plugin should be loaded. Defaults to `"00"`
* `config` (Hash): plugin configuration in form of a hash. This will be converted to a suitable structure understood by *liboconfig* which is the *collectd* configuration parser. Defaults to `{}`

#####Examples:

######Using a preinstalled plugin:
```puppet
collectd_plugin::perl::plugin { 'foo':
    module          => 'Collectd::Plugins::Foo',
    enable_debugger => "",
    include_dir     => '/usr/lib/collectd/perl5/lib',
}
```

######Using a plugin from a file from *source*:
```puppet
collectd_plugin::perl::plugin { 'baz':
    module      => 'Collectd::Plugins::Baz',
    provider    => 'file',
    source      => 'puppet:///modules/myorg/baz_collectd.pm',
    destination => '/path/to/my/perl5/modules'
}
```

######Using a plugin from cpan (requires the [puppet cpan module](https://forge.puppetlabs.com/meltwater/cpan)):
```puppet
collectd_plugin::perl::plugin {
  'openafs_vos':
    module        => 'Collectd::Plugins::OpenAFS::VOS',
    provider      => 'cpan',
    source        => 'Collectd::Plugins::OpenAFS',
    config        => {'VosBin' => '/usr/afsws/etc/vos'},
}
```

######Using a plugin from package source:
```puppet
collectd_plugin::perl::plugin {
  'bar':
    module        => 'Collectd::Plugins::Bar',
    provider      => 'package',
    source        => 'perl-Collectd-Plugins-Bar',
    config        => {'foo' => 'bar'},
}
```

####Class: `collectd_plugin::ping`

```puppet
collectd_plugin::ping {
  'example':
    hosts => ['example.com'],
}
```

####Class: `collectd_plugin::postgresql`

```puppet
collectd_plugin::postgresql::database{'monitoring_node1':
  name     => 'monitoring',
  port     => '5433',
  instance => 'node1',
  host     => 'localhost',
  user     => 'collectd',
  password => 'collectd',
  query    => 'log_delay',
}
collectd_plugin::postgresql::query{'log_delay':
  statement => 'SELECT * FROM log_delay_repli;',
  results   => [{
    type           => 'gauge',
    instanceprefix => 'log_delay',
    instancesfrom  => 'inet_server_port',
    valuesfrom     => 'log_delay',
  }],
}
collectd_plugin::postgresql::writer{'sqlstore':
  statement  => 'SELECT collectd_insert($1, $2, $3, $4, $5, $6, $7, $8, $9);',
  storerates => 'true',
}
```

You can as well configure this plugin as a parameterized class :

```puppet
class { 'collectd_plugin::postgresql':
  databases => {
    'postgres' => {
      'host'     => '/var/run/postgresql/',
      'user'     => 'postgres',
      'password' => 'postgres',
      'sslmode'  => 'disable',
      'query'    => [ 'query_plans', 'queries', 'table_states', 'disk_io' ],
    },
    'devdb' => {
      'host'     => 'host.example.com',
      'port'     => '5432',
      'user'     => 'postgres',
      'password' => 'secret',
      'sslmode'  => 'prefer',
    }
  }
}
```

####Class: `collectd_plugin::processes`

You can either specify processes / process matches at once:

```puppet
class { 'collectd_plugin::processes':
  processes => ['process1', 'process2'],
  process_matches => [
    { name => 'process-all', regex => 'process.*' }
  ],
}
```
####Class: `collectd_plugin::protocols`

 * `values` is an array of `Protocol` names, `Protocol:ValueName` pairs, or a regex
 * see `/proc/net/netstat` and `/proc/net/snmp` for a list of `Protocol` targets

 See [collectd.conf documentation] (https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_protocols) for details

```puppet
class { 'collectd_plugin::protocols':
  values => ['/^Tcp:*/', '/^Udp:*/', 'Icmp:InErrors' ],
  ignoreselected => false,
}
```

Or define single processes / process matches:
```puppet
collectd_plugin::processes::process { 'collectd' : }
```

```puppet
collectd_plugin::processes::processmatch { 'elasticsearch' :
  regex => '.*java.*org.elasticsearch.bootstrap.Elasticsearch'
}
```

####Class: `collectd_plugin::python`

 * `modulepaths` is an array of paths where will be Collectd looking for Python modules, Puppet will ensure that each of specified directories exists and it is owned by `root` (and `chmod 0750`). If you don't specify any `modulepaths` a default value for given distribution will be used.
 * `modules` a Hash containing configuration of Python modules, where the key is the module name
 * `globals` Unlike most other plugins, this one should set `Globals true`. This will cause collectd to export the name of all objects in the Python interpreter for all plugins to see. If you don't do this or your platform does not support it, the embedded interpreter will start anyway but you won't be able to load certain Python modules, e.g. "time".
 * `interactive` when `true` it will launch an interactive Python interpreter that reads from and writes to the terminal (default: `false`)
 * `logtraces` if a Python script throws an exception it will be logged by collectd with the name of the exception and the message (default: `false`)

 See [collectd-python documentation](https://collectd.org/documentation/manpages/collectd-python.5.shtml) for more details.

NOTE: Since `v3.4.0` the syntax of this plugin has changed. Make sure to update your existing configuration. Now you can specify multiple Python modules at once:

```puppet
class { 'collectd_plugin::python':
  modulepaths => ['/usr/share/collectd/python'],
  modules     => {
    'elasticsearch' => {
      'script_source' => 'puppet:///modules/myorg/elasticsearch_collectd_python.py',
      'config'        => {'Cluster' => 'elasticsearch'},
    },
    'another-module' => {
      'config'        => {'Verbose' => 'true'},
    }
  }
  logtraces   => true,
  interactive => false
}
```
When `script_source` provided, a file called `{module}.py` will be created in `$modulepath/$module.py`.

Or define single module:

```puppet
collectd_plugin::python::module {'zk-collectd':
  script_source => 'puppet:///modules/myorg/zk-collectd.py',
  config        => {
    'Hosts' => "localhost:2181"
  }
}
```

Each plugin might use different `modulepath`, however make sure that all paths are included in `collectd_plugin::python` variable `modulepaths`. If no `modulepath` is specified, OS default will be used.

```puppet
collectd_plugin::python::module {'my-module':
  modulepath    => '/var/share/collectd',
  script_source => 'puppet:///modules/myorg/my-module.py',
  config        => {
    'Key' => "value"
  }
}
```

####Class: `collectd_plugin::redis`

```puppet
class { 'collectd_plugin::redis':
  nodes => {
    'node1' => {
      'host'     => 'localhost',
    },
    'node2' => {
      'host'     => 'node2.example.com',
      'port'     => '6380',
      'timeout'  => 3000,
    }
  }
}
```

####Class: `collectd_plugin::rrdcached`

```puppet
class { 'collectd_plugin::rrdcached':
  daemonaddress => 'unix:/var/run/rrdcached.sock',
  datadir       => '/var/lib/rrdcached/db/collectd',
}
```

####Class: `collectd_plugin::rrdtool`

```puppet
class { 'collectd_plugin::rrdtool':
  datadir           => '/var/lib/collectd/rrd',
  createfilesasync  => false,
  rrarows           => 1200,
  rratimespan       => [3600, 86400, 604800, 2678400, 31622400],
  xff               => 0.1,
  cacheflush        => 900,
  cachetimeout      => 120,
  writespersecond   => 50
}
```

####Class: `collectd_plugin::sensors`

```puppet
class {'collectd_plugin::sensors':
  ignoreselected => false,
}
```

####Class: `collectd_plugin::snmp`

```puppet
class {'collectd_plugin::snmp':
  data  =>  {
    amavis_incoming_messages => {
      'Type'     => 'counter',
      'Table'    => false,
      'Instance' => 'amavis.inMsgs',
      'Values'   => ['AMAVIS-MIB::inMsgs.0']
    }
  },
  hosts => {
    debianvm => {
      'Address'   => '127.0.0.1',
      'Version'   => 2,
      'Community' => 'public',
      'Collect'   => ['amavis_incoming_messages'],
      'Interval'  => 10
    }
  },
}
```

####Class: `collectd_plugin::statsd`

```puppet
class { 'collectd_plugin::statsd':
  host            => '0.0.0.0',
  port            => 8125,
  deletecounters  => false,
  deletetimers    => false,
  deletegauges    => false,
  deletesets      => false,
  timerpercentile => 50,
}
```

####Class: `collectd_plugin::swap`

```puppet
class { 'collectd_plugin::swap':
  reportbydevice => false,
  reportbytes    => true
}
```

####Class: `collectd_plugin::syslog`

```puppet
class { 'collectd_plugin::syslog':
  log_level => 'warning'
}
```

####Class: `collectd_plugin::target_v5upgrade`

```puppet
class { 'collectd_plugin::target_v5upgrade':
}
```

####Class: `collectd_plugin::tcpconns`

```puppet
class { 'collectd_plugin::tcpconns':
  localports  => ['25', '12026'],
  remoteports => ['25'],
  listening   => false,
}
```
####Class: `collectd_plugin::tail`

```puppet
collectd_plugin::tail::file { 'exim-log':
  filename => '/var/log/exim4/mainlog',
  instance => 'exim',
  matches  => [
    {
      regex    => 'S=([1-9][0-9]*)',
      dstype   => 'CounterAdd',
      type     => 'ipt_bytes',
      instance => 'total',
    },
    {
      regex    => '\\<R=local_user\\>',
      dstype   => 'CounterInc',
      type     => 'counter',
      instance => 'local_user',
    }
  ]
}
```

####Class: `collectd_plugin::unixsock`

```puppet
class {'collectd_plugin::unixsock':
  socketfile   => '/var/run/collectd-sock',
  socketgroup  => 'nagios',
  socketperms  => '0770',
  deletesocket => false,
}
```

####Class: `collectd_plugin::uptime`

```puppet
class {'collectd_plugin::uptime':
}
```

####Class: `collectd_plugin::users`
```puppet
class {'collectd_plugin::users':
}
```

####Class: `collectd_plugin::varnish`

```puppet
class { 'collectd_plugin::varnish':
  instances => {
    'instanceName' => {
      'CollectCache' => 'true',
      'CollectBackend' => 'true',
      'CollectConnections' => 'true',
      'CollectSHM' => 'true',
      'CollectESI' => 'false',
      'CollectFetch' => 'true',
      'CollectHCB' => 'false',
      'CollectTotals' => 'true',
      'CollectWorkers' => 'true',
    }
  },
}
```

####Class: `collectd_plugin::vmem`

```puppet
class { 'collectd_plugin::vmem':
  verbose => true,
}
```

####Class: `collectd_plugin::write_graphite`

The `write_graphite` plugin writes data to Graphite, an open-source metrics storage and graphing project.
```puppet
collectd_plugin::write_graphite::carbon {'my_graphite':
  graphitehost   => 'graphite.example.org',
  graphiteport   => 2003,
  graphiteprefix => '',
  protocol       => 'tcp'
}
```

You can define multiple Graphite backends where will be metrics send. Each backend should have unique title:

```puppet
collectd_plugin::write_graphite::carbon {'secondary_graphite':
  graphitehost      => 'graphite.example.org',
  graphiteport      => 2004,
  graphiteprefix    => '',
  protocol          => 'udp',
  escapecharacter   => '_',
  alwaysappendds    => true,
  storerates        => true,
  separateinstances => false,
  logsenderrors     => true
}
```

####Class: `collectd_plugin::write_http`

```puppet
class { 'collectd_plugin::write_http':
  urls => {
    'collect1.example.org' => { 'format' => 'JSON' },
    'collect2.example.org' => {},
  }
}
```

####Class: `collectd_plugin::write_network`

**Deprecated**

```puppet
class { 'collectd_plugin::write_network':
  servers => {
    'collect1.example.org' => { 'serverport' => '25826' },
    'collect2.example.org' => { 'serverport' => '25826' }
  }
}
```

####Class: `collectd_plugin::write_riemann`

```puppet
class { 'collectd_plugin::write_riemann':
  riemann_host => 'riemann.example.org',
  riemann_port => 5555,
}
```


####Class: `collectd_plugin::zfs_arc`

```puppet
class { 'collectd_plugin::zfs_arc':
}
```

##Limitations

See metadata.json for supported platforms

##Known issues

Some plugins will need two runs of Puppet to fully generate the configuration for collectd. See [this issue](https://github.com/puppet-community/puppet-collectd/issues/162).

##Development

### Running tests

This project contains tests for [rspec-puppet](http://rspec-puppet.com/).

Quickstart:

```bash
gem install bundler
bundle install
bundle exec rake lint
bundle exec rake validate
bundle exec rake spec SPEC_OPTS='--format documentation'
```

### Version scoping

Some plugins or some options in plugins are only available for recent versions of collectd.

This module shall not use unsupported configuration directives. Look at [templates/loadplugin.conf.erb](https://github.com/puppet-community/puppet-collectd/blob/master/templates/loadplugin.conf.erb) for a hands-on example.

Please make use of the search by branch/tags on the collectd github to see when a function has been first released.

Reading the [collectd.conf.pod](https://github.com/collectd/collectd/blob/master/src/collectd.conf.pod) file is good, validating the presence of the code in the .c files is even better.
