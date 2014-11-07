# Define:: shinken::poller
#
#
define shinken::poller(
  $poller_name         = $name,
  $address             = $::ipaddress,
  $port                = 7771,
  $spare               = false,
  $realm               = 'All',
  $manage_sub_realms   = false,
  $poller_tags         = '',
  $modules             = '',
  $min_workers         = 0,
  $max_workers         = 0,
  $processes_by_worker = 256,
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
  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }

  $resource_type = 'poller'
  $resource_options = {
    'poller_name'         => $poller_name,
    'address'             => $address,
    'port'                => $port,
    'spare'               => $manage_spare,
    'realm'               => $realm,
    'manage_sub_realms'   => $manage_manage_sub_realms,
    'poller_tags'         => $poller_tags,
    'modules'             => $manage_module,
    'min_workers'         => $min_workers,
    'max_workers'         => $max_workers,
    'processes_by_worker' => $processes_by_worker,
    'polling_interval'    => $polling_interval,
    'timeout'             => $timeout,
    'data_timeout'        => $data_timeout,
    'max_check_attempts'  => $max_check_attempts,
    'check_interval'      => $check_interval,
    'use_ssl'             => $manage_use_ssl,
    'hard_ssl_name_check' => $manage_hard_ssl_name_check,
  }

  file { "shinken-poller-${name}.cfg":
    ensure  => $shinken::daemon::poller::manage_file,
    path    => "${shinken::config_dir}/pollers/${name}.cfg",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $shinken::daemon::poller::manage_service_autorestart,
    content => template('shinken/simple.cfg.erb'),
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }

} # Define:: shinken::poller
