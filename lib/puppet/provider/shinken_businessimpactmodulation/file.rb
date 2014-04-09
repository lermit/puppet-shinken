require 'puppet/provider/shinken_file'

Puppet::Type.type(:shinken_businessimpactmodulation).provide :file, :parent => Puppet::Provider::Shinken_file do

  def base_path
    '/etc/shinken/businessimpactmodulation/'
  end

end
