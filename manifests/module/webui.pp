# Class:: shinken::module::webui
#  Install and configure shinen webui.
#
# [*ensure*]
#  present or absent
#  Default: present
#
# [*uri*]
#  The mongodb connection URI.
#  Default : mongodb://localhost/?safe=false
#
# [*database*]
#  The mongodb database name.
#  Default : shinken
#
# [*username*]
#  The mongodb connection username. If no username/password is needed let this
#  argument empty.
#  Default: ''
#
# [*password*]
#  As [*username*] for password.
#  You have to specify an username if you set a password.
#  Default: ''
#
# [*replica_set*]
#  The replica_set to used. If no replica_set is needed let this argument
#  empty.
#  Default: ''
#
class shinken::module::webui (
  $ensure            = 'present',
  $host              = '0.0.0.0',
  $port              = '7767',
  $auth_secret       = fqdn_rand(100000000000),
  $allow_html_output = '1',
  $max_output_length = '1024',
  $manage_acl        = '1',
  $play_sound        = '0',
  $login_text        = 'Login to the Shinken WebUI - Live System',
  $refresh_period    = '60',
  $modules           = '',
){

  # Install webui
  shinken::install { 'webui': }

  if is_array($modules) {
    $manage_module = join($modules,',')
  } else {
    $manage_module  = $modules
  }

  $manage_options = {
    'host'              => $host,
    'port'              => $port,
    'auth_secret'       => $auth_secret,
    'allow_html_output' => $allow_html_output,
    'max_output_length' => $max_output_length,
    'manage_acl'        => $manage_acl,
    'play_sound'        => $play_sound,
    'login_text'        => $login_text,
    'refresh_period'    => $refresh_period,
    'modules'           => $manage_module,
  }

  shinken::module::config { 'webui':
    ensure   => $ensure,
    mod_type => 'webui',
    options  => $manage_options,
  }

} # Class:: shinken::module::mongodb
