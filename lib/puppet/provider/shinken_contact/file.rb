require 'puppet/provider/shinken_file'

Puppet::Type.type(:shinken_contact).provide :file, :parent => Puppet::Provider::Shinken_file do

  @@shinken_classvars = {
    :primary_id => 'contact_name',
    :base_path => '/etc/shinken/contacts/',
  }

end
