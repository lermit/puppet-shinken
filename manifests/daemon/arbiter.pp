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

  service { 'shinken-arbiter':
    ensure    => $shinken::daemon::arbiter::manage_service_ensure,
    name      => 'shinken-arbiter',
    enable    => $shinken::daemon::arbiter::manage_service_enable,
    hasstatus => $shinken::service_status,
    require   => Package[$shinken::package],
    noop      => $shinken::bool_noops,
  }


} # Class:: shinken::daemon::arbiter
