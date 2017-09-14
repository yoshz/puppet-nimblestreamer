# nimblestreamer

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with nimblestreamer](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs [Nimble Streamer](https://wmspanel.com/nimble) on CentOS and
sets up the configuration file.

Further configuration is done by using the [WMS Panel](https://wmspanel.com/).

## Setup

Add the module to node configuration:

```puppet
  node server {
    class { '::nimblestreamer':
      port => 80,
    }
  }
```

## Usage

Basic configuration just makes sure that Nimble is installed and running.

If you want to register the server with the WMS Panel you have to run the 
following command manually on the server:

```bash
sudo /usr/bin/nimble_regutil -u test@yourcompany.com -p mypassword
```

The configuration file `/etc/nimble/nimble.conf` is now updated with a `panel_uuid`
and a `panel_password`. Copy these values back to your node configuration:

```puppet
  node server {
    class { '::nimblestreamer':
      panel_uuid => 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',
      panel_password => 'hash',
    }
  }
```

## Reference

All *mandatory* configuration are supported by this module as defined on this page:
http://blog.wmspanel.com/p/nimble-streamer-configuration.html

## Limitations

Only CentOS 7 is tested currently.

## Development

You are free to fork this repository and support to additional OS or configuration options.