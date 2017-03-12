class network::config {

  include ::rclocal

  ::rclocal::register{ 'set_gateway':
    content => "
/sbin/route del default
/sbin/route add default gw ${gateway}

until ping -nq -c3 ${gateway}; do
   echo 'Waiting for network...'
done
",
    order   => '02'
  }
}
