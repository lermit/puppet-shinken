# Class:: shinken::daemon::scheduler
#
#
class shinken::daemon::scheduler (
  $disable = false,
) {

  require shinken

  $bool_disable = any2bool($disable)

  $manage_service_ensure = $shinken::daemon::scheduler::bool_disable ? {
    true  => 'stopped',
    false => 'running',
  }
  $manage_service_enable = $shinken::daemon::scheduler::bool_disable ? {
    true  => false,
    false => $shinken::bool_disableboot ? {
      true  => false,
      false => true,
    },
  }
  $manage_service_autorestart = $shinken::daemon::scheduler::bool_disable ? {
    true  => undef,
    false => Service['shinken-scheduler'],
  }
  $manage_file = $shinken::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }
  $manage_file_content = template('shinken/daemon/schedulerd.ini.erb')

  service { 'shinken-scheduler':
    ensure    => $shinken::daemon::scheduler::manage_service_ensure,
    name      => 'shinken-scheduler',
    enable    => $shinken::daemon::scheduler::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }

  file { 'shinken-scheduler.conf':
    ensure  => $shinken::daemon::scheduler::manage_file,
    path    => "${shinken::config_dir}/daemons/schedulerd.ini",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $shinken::daemon::scheduler::manage_service_autorestart,
    content => $shinken::daemon::scheduler::manage_file_content,
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }

} # Class:: shinken::daemon::scheduler
