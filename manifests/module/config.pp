# Define:: shinken::module::config
#  add a config for specified module.
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
    $options
  )

  shinken::config { "module-${title}":
    ensure  => $ensure,
    type    => 'module',
    path    => "modules/${config_file}",
    options => $resource_options,
  }

} # Define:: shinken::module::config
