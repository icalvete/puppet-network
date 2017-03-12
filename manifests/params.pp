class network::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
