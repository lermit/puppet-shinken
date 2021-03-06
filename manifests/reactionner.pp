# Define:: shinken::reactionner
#
#
define shinken::reactionner(
  $reactionner_name    = $name,
  $address             = $::ipaddress,
  $port                = 7769,
  $spare               = false,
  $realm               = 'All',
  $manage_sub_realms   = false,
  $reactionner_tags    = '',
  $modules             = '',
  $passive             = false,
  $min_workers         = 0,
  $max_workers         = 15,
  $polling_interval    = 1,
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
  $bool_use_ssl = any2bool($use_ssl)
  $bool_hard_ssl_name_check = any2bool($hard_ssl_name_check)
  $bool_passive = any2bool($passive)

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
  $manage_passive = $bool_passive ? {
    true  => 1,
    false => 0,
  }
  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }

  $resource_options = {
    'reactionner_name'    => $reactionner_name,
    'address'             => $address,
    'port'                => $port,
    'spare'               => $manage_spare,
    'realm'               => $realm,
    'manage_sub_realms'   => $manage_manage_sub_realms,
    'reactionner_tags'    => $reactionner_tags,
    'modules'             => $manage_module,
    'passive'             => $manage_passive,
    'min_workers'         => $min_workers,
    'max_workers'         => $max_workers,
    'polling_interval'    => $polling_interval,
    'timeout'             => $timeout,
    'data_timeout'        => $data_timeout,
    'max_check_attempts'  => $max_check_attempts,
    'check_interval'      => $check_interval,
    'use_ssl'             => $manage_use_ssl,
    'hard_ssl_name_check' => $manage_hard_ssl_name_check,
  }

  shinken::config { "reactionners/${name}.cfg":
    ensure  => $shinken::daemon::reactionner::manage_file,
    type    => 'reactionner',
    options => $resource_options,
  }

} # Define:: shinken::reactionner
