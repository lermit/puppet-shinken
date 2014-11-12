# Define:: shinken::module::config
#  add a config for specified module.
#
#
# [*ensure*]
#  present or absent
#  Default: present
#
# [*mod_name*]
#  The module name as in config file.
#  Default : $title
#
# [*mod_type*]
#  The module type as in config file.
#  Default: $title
#
# [*config_file*]
#  The config file name in modules dif.
#  Default : ${title}.cfg
#
# [*options*]
#  All additional configuration as hash.
#
#
define shinken::module::config (
  $ensure      = 'present',
  $mod_name    = $title,
  $mod_type    = $title,
  $config_file = "${title}.cfg",
  $options     = {}
) {

  require 'shinken'

  $resource_options = merge(
    {
      'module_name' => $mod_name,
      'module_type' => $mod_type,
    },
    $options)

  file { "shinken-module-${title}.cfg":
    ensure  => $ensure,
    path    => "${shinken::config_dir}/modules/${config_file}",
    mode    => $shinken::config_file_mode,
    owner   => $shinken::config_file_owner,
    group   => $shinken::config_file_group,
    require => Package[$shinken::package],
    content => template('shinken/simple.cfg.erb'),
    replace => $shinken::manage_file_replace,
    audit   => $shinken::manage_audit,
    noop    => $shinken::bool_noops,
  }


} # Define:: shinken::module::config
