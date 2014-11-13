# Class:: shinken::module::retention-mongodb
#  Install and configure retention-mongodb module.
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
class shinken::module::retention-mongodb (
  $ensure      = 'present',
  $uri         = 'mongodb://localhost/?safe=false',
  $database    = 'shinken',
  $replica_set = '',
){

  # Install retention-mongodb
  shinken::install { 'retention-mongodb': }

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
    $manage_replica_set
  )

  shinken::module::config { 'retention-mongodb':
    ensure   => $ensure,
    mod_type => 'mongodb_retention',
    options  => $manage_options,
  }

} # Class:: shinken::module::mongodb
