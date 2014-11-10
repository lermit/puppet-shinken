# Class:: shinken::daemon::reactionner
#
#
class shinken::daemon::reactionner (
  $disable = false,
) {

  require shinken

  $bool_disable = any2bool($disable)

  $manage_service_ensure = $shinken::daemon::reactionner::bool_disable ? {
    true  => 'stopped',
    false => 'running',
  }
  $manage_service_enable = $shinken::daemon::reactionner::bool_disable ? {
    true  => false,
    false => $shinken::bool_disableboot ? {
      true  => false,
      false => true,
    },
  }
  $manage_service_autorestart = $shinken::daemon::reactionner::bool_disable ? {
    true  => undef,
    false => Service['shinken-reactionner'],
  }
  $manage_file = $shinken::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }
  $manage_file_content = template('shinken/daemon/reactionnerd.ini.erb')

  service { 'shinken-reactionner':
    ensure    => $shinken::daemon::reactionner::manage_service_ensure,
    name      => 'shinken-reactionner',
    enable    => $shinken::daemon::reactionner::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }

  file { 'shinken-reactionner.conf':
    ensure  => $shinken::daemon::reactionner::manage_file,
    path    => "${shinken::config_dir}/daemons/reactionnerd.ini",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $shinken::daemon::reactionner::manage_service_autorestart,
    content => $shinken::daemon::reactionner::manage_file_content,
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }

} # Class:: shinken::daemon::reactionner
