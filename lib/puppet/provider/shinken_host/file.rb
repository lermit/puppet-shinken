require 'puppet/provider/shinken_file'

Puppet::Type.type(:shinken_host).provide :file, :parent => Puppet::Provider::Shinken_file do

  def base_path
    '/etc/shinken/hosts/'
  end

  def object_type
    'hosts'
  end

end
