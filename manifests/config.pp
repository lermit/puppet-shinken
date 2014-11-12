# Define:: shinken::config
#
# [*type*]
#  The resource type. For the instance if you set type to 'poller' the
#  resulting config file will start with
#
#    # File managed by puppet
#    define poller {
#
#  This option is mandatory.
#
#
# [*ensure*]
#  present or absent
#  Default: present
#
# [*path*]
#  Relative to shinken config dir config path. For the instance if you set
#  arbiters/master.cfg the resulting config will be
#  /etc/shinken/arbiters/master.cfg
#  Default: $name
#
# [*notify*]
#  Service to notify. Depending if $autorestart is globaly enabled we will
#  restart shinken-arbiter by default.
#  Default: ''
#
define shinken::config(
  $type,
  $ensure  = 'present',
  $path    = $name,
  $notify  = '',
  $options = {}
) {

  require shinken

  $manage_path = "${shinken::config_dir}/${path}"
  $manage_notify = $notify ? {
    '' => $shinken::bool_service_autorestart ? {
      true  => Service['shinken-arbiter'],
      false => undef,
    },
    default => undef,
  }

  $resource_options = $options

  file { "shinken-config-${name}":
    ensure  => $ensure,
    path    => "${shinken::config_dir}/${name}",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    notify  => $manage_notify,
    content => template('shinken/simple.cfg.erb'),
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }



} # Define:: shinken::config
