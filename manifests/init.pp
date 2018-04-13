class network (

  $gateway         = pick($gateway, regsubst($network_eth0, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\1.\2.\3.1')),
  $wait_to_gateway = true

) inherits network::params {

  anchor {'network::begin':
    before => Class['network::install']
  }
  class {'network::install':
    require => Anchor['network::begin']
  }
  class {'network::config':
    require => Class['network::install']
  }
  anchor {'network::end':
    require => Class['network::config']
  }
}
