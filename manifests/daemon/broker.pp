# Class:: shinken::daemon::broker
#
#
class shinken::daemon::broker (
  $disable = false,
) {

  $bool_disable = any2bool($disable)

  $manage_service_ensure = $shinken::daemon::broker::bool_disable ? {
    true  => 'stopped',
    false => 'running',
  }
  $manage_service_enable = $shinken::daemon::broker::bool_disable ? {
    true  => false,
    false => $shinken::bool_disableboot ? {
      true  => false,
      false => true,
    },
  }

  service { 'shinken-broker':
    ensure    => $shinken::daemon::broker::manage_service_ensure,
    name      => 'shinken-broker',
    enable    => $shinken::daemon::broker::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }


} # Class:: shinken::daemon::broker
