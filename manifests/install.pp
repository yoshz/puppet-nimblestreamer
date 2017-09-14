class nimblestreamer::install {
  case $::operatingsystem {
    'CentOS': {
      yumrepo { 'nimblestreamer':
        descr    => "Nimble Streamer repository",
        baseurl  => "http://nimblestreamer.com/centos/${::operatingsystemmajrelease}/\$basearch",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => "http://nimblestreamer.com/gpg.key",
      }
    }
    default: {
      fail('Operating system not supported yet')
    }
  }
  package { 'nimble': ensure => latest }
}