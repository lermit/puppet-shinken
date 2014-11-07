# Class:: shinken::daemon::arbiter
#
#
class shinken::daemon::arbiter (
  $disable = false,
) {

  $bool_disable = any2bool($disable)

  $manage_service_ensure = $shinken::daemon::arbiter::bool_disable ? {
    true  => 'stopped',
    false => 'running',
  }
  $manage_service_enable = $shinken::daemon::arbiter::bool_disable ? {
    true  => false,
    false => $shinken::bool_disableboot ? {
      true  => false,
      false => true,
    },
  }
  $manage_service_autorestart = $shinken::daemon::arbiter::bool_disable ? {
    true  => undef,
    false => Service['shinken-arbiter'],
  }
  $manage_file = $shinken::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }
  $manage_file_content = template('shinken/daemon/arbiterd.ini.erb')

  service { 'shinken-arbiter':
    ensure    => $shinken::daemon::arbiter::manage_service_ensure,
    name      => 'shinken-arbiter',
    enable    => $shinken::daemon::arbiter::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }

  file { 'shinken-arbiter.conf':
    ensure  => $shinken::daemon::arbiter::manage_file,
    path    => "${shinken::config_dir}/shinken.cfg",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $shinken::daemon::arbiter::manage_service_autorestart,
    content => $shinken::daemon::arbiter::manage_service_autorestart,
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }

} # Class:: shinken::daemon::arbiter
