# Class: shinken::params
#
# This class defines default parameters used by the main module class shinken
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to shinken class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class shinken::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'shinken',
  }

  $service = $::operatingsystem ? {
    default => 'shinken',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'shinken',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'shinken',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/shinken',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/shinken/shinken.cfg',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'shinken',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'shinken',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/shinken',
    default                   => '/etc/sysconfig/shinken',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/shinken/arbiterd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/shinken',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/shinken',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/shinken/shinken.log',
  }

  $port = '42'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

  # Specific params
  $package_provider = 'pip'
  $install_prerequisite = true

  $pip_package = $::operatingsystem ? {
    default => 'python-pip',
  }

  $pycurl_package = $::operatingsystem ? {
    default => 'python-pycurl',
  }

  $enabled_service = ''
  $api_key = ''
  $proxy = ''

}
