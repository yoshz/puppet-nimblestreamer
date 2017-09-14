# Class: nimblestreamer
# ===========================
#
# This class installs Nimble Streamer (https://wmspanel.com/nimble)
#
# Variables
# ----------
#
# For a list of available parameters go to:
#   http://blog.wmspanel.com/p/nimble-streamer-configuration.html
#
# Only mandatory parameters are supported now.
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
  Optional[Integer] $ssl_port            = undef,
  Optional[String]  $ssl_certificate     = undef,
  Optional[String]  $ssl_certificate_key = undef,
  Optional[String]  $ssl_certificate_key_pass = undef,
  Optional[String]  $crossdomain_xml_allow_access_from_domain = undef,
  Optional[String]  $crossdomain_xml     = undef,
  Optional[String]  $access_control_allow_origin = undef,
  Optional[String]  $access_control_allow_credentials = undef,
  Optional[String]  $access_control_expose_headers = undef,
  Optional[String]  $access_control_allow_headers = undef,
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