require 'puppet/provider/shinken_file'

Puppet::Type.type(:shinken_host).provide :file, :parent => Puppet::Provider::Shinken_file do

  @@shinken_classvars = {
    :primary_id => 'host_name',
    :base_path => '/etc/shinken/hosts/',
  }

end
