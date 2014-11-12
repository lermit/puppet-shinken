# Define:: shinken::broker
#
#
define shinken::broker(
  $broker_name         = $name,
  $address             = $::ipaddress,
  $port                = 7772,
  $spare               = false,
  $manage_arbiters     = true,
  $realm               = 'All',
  $manage_sub_realms   = false,
  $modules             = '',
  $timeout             = 3,
  $data_timeout        = 120,
  $max_check_attempts  = 3,
  $check_interval      = 60,
  $use_ssl             = false,
  $hard_ssl_name_check = false,
){

  require shinken

  $bool_spare = any2bool($spare)
  $bool_manage_sub_realms = any2bool($manage_sub_realms)
  $bool_manage_arbiters = any2bool($manage_arbiters)
  $bool_use_ssl = any2bool($use_ssl)
  $bool_hard_ssl_name_check = any2bool($hard_ssl_name_check)

  $manage_spare = $bool_spare ? {
    true  => 1,
    false => 0,
  }
  $manage_manage_sub_realms = $bool_manage_sub_realms ? {
    true  => '1',
    false => '0',
  }
  $manage_use_ssl = $bool_use_ssl ? {
    true  => 1,
    false => 0,
  }
  $manage_hard_ssl_name_check = $bool_hard_ssl_name_check ? {
    true  => 1,
    false => 0,
  }
  $manage_manage_arbiters = $bool_manage_arbiters ? {
    true  => 1,
    false => 0,
  }
  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }

  $resource_options = {
    'broker_name'         => $broker_name,
    'address'             => $address,
    'port'                => $port,
    'spare'               => $manage_spare,
    'manage_arbiters'     => $manage_manage_arbiters,
    'realm'               => $realm,
    'manage_sub_realms'   => $manage_manage_sub_realms,
    'modules'             => $manage_module,
    'timeout'             => $timeout,
    'data_timeout'        => $data_timeout,
    'max_check_attempts'  => $max_check_attempts,
    'check_interval'      => $check_interval,
    'use_ssl'             => $manage_use_ssl,
    'hard_ssl_name_check' => $manage_hard_ssl_name_check,
  }

  shinken::config { "brokers/${name}.cfg":
    ensure  => $shinken::daemon::broker::manage_file,
    type    => 'broker',
    options => $resource_options,
  }

} # Define:: shinken::broker
