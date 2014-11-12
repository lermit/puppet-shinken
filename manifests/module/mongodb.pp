# Class:: shinken::module::mongodb
#  Install and configure mod-mongodb module.
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
class shinken::module::mongodb(
  $ensure      = 'present',
  $uri         = 'mongodb://localhost/?safe=false',
  $database    = 'shinken',
  $username    = '',
  $password    = '',
  $replica_set = '',
){

  # TODO Install mod-mongodb

  $manage_credential_hash = {
    'username' => $username,
    'password' => $password,
  }
  $manage_credential = $username ? {
    ''      => undef,
    default => $manage_credential_hash,
  }
  $manage_replica_set_hash = {
    'replica_set' => $replica_set,
  }
  $manage_replica_set = $replica_set ? {
    ''      => undef,
    default => $manage_replica_set_hash,
  }

  $manage_options = merge(
    {
      'uri'      => $uri,
      'database' => $database,
    },
    $manage_credential,
    $manage_replica_set
  )

  shinken::module::config { 'mongodb':
    ensure  => $ensure,
    options => $manage_options,
  }

} # Class:: shinken::module::mongodb
