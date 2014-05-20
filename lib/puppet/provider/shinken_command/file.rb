require 'puppet/provider/shinken_file'

Puppet::Type.type(:shinken_command).provide :file, :parent => Puppet::Provider::Shinken_file do

  def base_path
    '/etc/shinken/commands/'
  end

  def object_type
    'commands'
  end

end
