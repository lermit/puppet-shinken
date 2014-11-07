# Define:: shinken::arbiter
#
#
define shinken::arbiter(
  $arbiter_name        = $name,
  $spare               = false,
  $address             = $::ipaddress,
  $port                = 7770,
  $modules             = [ 'named-pipe' ],
  $use_ssl             = false,
  $hard_ssl_name_check = false,
){

  require shinken

  $bool_spare = any2bool($spare)
  $bool_use_ssl = any2bool($use_ssl)
  $bool_hard_ssl_name_check = any2bool($hard_ssl_name_check)

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
  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }

  $resource_type = 'arbiter'
  $resource_options = {
    'arbiter_name'         => $arbiter_name,
    'address'             => $address,
    'port'                => $port,
    'spare'               => $manage_spare,
    'modules'             => $manage_module,
    'use_ssl'             => $manage_use_ssl,
    'hard_ssl_name_check' => $manage_hard_ssl_name_check,
  }

  file { "shinken-arbiter-${name}.cfg":
    ensure  => $shinken::daemon::arbiter::manage_file,
    path    => "${shinken::config_dir}/arbiters/${name}.cfg",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $shinken::daemon::arbiter::manage_service_autorestart,
    content => template('shinken/simple.cfg.erb'),
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }

} # Define:: shinken::arbiter
