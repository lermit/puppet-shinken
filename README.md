[![Build Status](https://travis-ci.org/lermit/puppet-shinken.png?branch=master)](https://travis-ci.org/lermit/puppet-shinken)
# Puppet module: shinken

This is a Puppet module for shinken based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Romain THERRAT

Shinken is a monitoring system. See http://www.shinken-monitoring.org/ and/or http://shinken.io/  for more information.

For more information about Example42 puppet modules see official website: http://www.example42.com

Shinken puppet module official git repository is http://github.com/lermit/puppet-shinken

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

If you plane to use custom type with mongo provider you will need to install "mongo" gem. Simply run 'bundler install' into puppet module root directory for easy installation.

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install shinken with default settings

        class { 'shinken': }

* Install a specific version of shinken package

        class { 'shinken':
          version => '1.0.1',
        }

* Disable shinken service.

        class { 'shinken':
          disable => true
        }

* Remove shinken package

        class { 'shinken':
          absent => true
        }

* Enable auditing without without making changes on existing shinken configuration *files*

        class { 'shinken':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'shinken':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { 'shinken':
          source => [ "puppet:///modules/example42/shinken/shinken.conf-${hostname}" , "puppet:///modules/example42/shinken/shinken.conf" ],
        }


* Use custom source directory for the whole configuration dir

        class { 'shinken':
          source_dir       => 'puppet:///modules/example42/shinken/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative.

        class { 'shinken':
          template => 'example42/shinken/shinken.conf.erb',
        }

* Automatically include a custom subclass

        class { 'shinken':
          my_class => 'example42::my_shinken',
        }


## USAGE - Example42 extensions management
* Activate puppi (recommended, but disabled by default)

        class { 'shinken':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands

        class { 'shinken':
          puppi        => true,
          puppi_helper => 'myhelper',
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'shinken':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'shinken':
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }

## TESTING

In order to run test you need

* Install git (aptitude install git for debian user)
* Run 'rake spec' in root directory

For more information about puppet module testing see http://puppetlabs.com/blog/the-next-generation-of-puppet-module-testing

