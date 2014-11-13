# Define:: shinken::install
#
# Install something from shinken.io
#
define shinken::install(
  $package_name = $name,
){

  require 'shinken'

  package { $title:
    name     => $package_name,
    require  => File['shinken.ini'],
    provider => 'shinken',
  }

} # Define:: shinken::install
