class network::config {
  
  include ::rclocal

  ::rclocal::register{ 'set_gateway':
    content => "
/sbin/route del default
/sbin/route add default gw ${network::gateway}
",
    order   => '02'
  }
 
  if $network::wait_to_gateway {
    ::rclocal::register{ 'set_wait_to_gateway':
      content => "
until ping -nq -c3 ${network::gateway}; do
   echo 'Waiting for network...'
done
",
      order   => '03'
    }
  }
}
