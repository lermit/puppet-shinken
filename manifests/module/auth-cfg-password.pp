# Class:: shinken::module::auth-cfg-password
#  Install and configure auth-cfg-password module.
#
# [*ensure*]
#  present or absent
#  Default: present
#
class shinken::module::auth-cfg-password (
  $ensure      = 'present',
){

  shinken::install { 'auth-cfg-password': }

  shinken::module::config { 'auth-cfg-password':
    ensure   => $ensure,
    mod_type => 'cfg_password_webui',
  }

} # Class:: shinken::module::auth-cfg-password
