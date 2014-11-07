# Class:: shinken::daemon::poller
#
#
class shinken::daemon::poller (
  $disable = false,
) {

  $bool_disable = any2bool($disable)

  $manage_service_ensure = $shinken::daemon::poller::bool_disable ? {
    true  => 'stopped',
    false => 'running',
  }
  $manage_service_enable = $shinken::daemon::poller::bool_disable ? {
    true  => false,
    false => $shinken::bool_disableboot ? {
      true  => false,
      false => true,
    },
  }

  service { 'shinken-poller':
    ensure    => $shinken::daemon::poller::manage_service_ensure,
    name      => 'shinken-poller',
    enable    => $shinken::daemon::poller::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }


} # Class:: shinken::daemon::poller
