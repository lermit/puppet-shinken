# Class:: shinken::daemon::scheduler
#
#
class shinken::daemon::scheduler (
  $disable = false,
) {

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

  service { 'shinken-scheduler':
    ensure    => $shinken::daemon::scheduler::manage_service_ensure,
    name      => 'shinken-scheduler',
    enable    => $shinken::daemon::scheduler::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }


} # Class:: shinken::daemon::scheduler
