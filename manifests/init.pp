# Class: nimblestreamer
# ===========================
#
# This class installs Nimble Streamer (https://wmspanel.com/nimble)
#
# Variables
# ----------
#
# Only mandatory parameters can be set as class arguments.
# All other parameters can be set using the $parameters argument.
#
# For a list of available parameters go to:
#   http://blog.wmspanel.com/p/nimble-streamer-configuration.html
#
# Examples
# --------
#
# @example
#    class { 'nimblestreamer': }
#
# Authors
# -------
#
# Yosh de Vos <yosh@elzorro.nl>
#
class nimblestreamer (
  Integer           $port                = 8081,
  String            $logging             = 'info',
  Integer           $worker_threads      = 1,
  Integer           $max_cache_size      = 64,
  Integer           $max_disk_cache_size = 4096,
  String            $cache_path          = '/var/cache/nimble',
  Optional[String]  $panel_uuid          = undef,
  Optional[String]  $panel_password      = undef,
  Hash              $parameters          = {},
) {
  include nimblestreamer::install
  file { '/etc/nimble/nimble.conf':
    content  => template('nimblestreamer/nimble.erb'),
    ensure   => 'file',
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
    notify   => Service['nimble'],
  }
  service { 'nimble':
    ensure => 'running',
    enable => true,
  }
}