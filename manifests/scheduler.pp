# Define:: shinken::scheduler
#
#
define shinken::scheduler(
  $scheduler_name     = $name,
  $address             = $::ipaddress,
  $port                = 7771,
  $spare               = false,
  $weight              = 1,
  $realm               = 'All',
  $modules             = '',
  $timeout             = 3,
  $data_timeout        = 120,
  $max_check_attempts  = 3,
  $check_interval      = 60,
  $use_ssl             = false,
  $hard_ssl_name_check = false,
  $skip_initial_broks  = false,
  $satellitemap        = '',
){

  require shinken

  $bool_spare = any2bool($spare)
  $bool_use_ssl = any2bool($use_ssl)
  $bool_hard_ssl_name_check = any2bool($hard_ssl_name_check)
  $bool_skip_initial_broks = any2bool($skip_initial_broks)

  $manage_spare = $bool_spare ? {
    true  => 1,
    false => 0,
  }
  $manage_use_ssl = $bool_use_ssl ? {
    true  => 1,
    false => 0,
  }
  $manage_hard_ssl_name_check = $bool_hard_ssl_name_check ? {
    true  => 1,
    false => 0,
  }
  $manage_skip_initial_broks = $bool_skip_initial_broks ? {
    true  => 1,
    false => 0,
  }
  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }
  if is_array($satellitemap) {
    $manage_satellitemap = join($satellitemap, ',')
  } else {
    $manage_satellitemap = $satellitemap
  }

  $resource_options = {
    'scheduler_name'      => $scheduler_name,
    'address'             => $address,
    'port'                => $port,
    'spare'               => $manage_spare,
    'weight'              => $weight,
    'realm'               => $realm,
    'modules'             => $manage_module,
    'timeout'             => $timeout,
    'data_timeout'        => $data_timeout,
    'max_check_attempts'  => $max_check_attempts,
    'check_interval'      => $check_interval,
    'use_ssl'             => $manage_use_ssl,
    'hard_ssl_name_check' => $manage_hard_ssl_name_check,
    'skip_initial_broks'  => $manage_skip_initial_broks,
    'satellitemap'        => $manage_satellitemap,
  }

  shinken::config { "schedulers/${name}.cfg":
    ensure  => $shinken::daemon::scheduler::manage_file,
    type    => 'scheduler',
    options => $resource_options,
  }

} # Define:: shinken::scheduler
