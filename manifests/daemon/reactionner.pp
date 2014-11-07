# Class:: shinken::daemon::reactionner
#
#
class shinken::daemon::reactionner (
  $disable = false,
) {

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

  service { 'shinken-reactionner':
    ensure    => $shinken::daemon::reactionner::manage_service_ensure,
    name      => 'shinken-reactionner',
    enable    => $shinken::daemon::reactionner::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }


} # Class:: shinken::daemon::reactionner
