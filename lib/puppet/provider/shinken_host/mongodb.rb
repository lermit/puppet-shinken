require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_host).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  def collection_name
    'hosts'
  end

  desc "MongoDB provider for shinken_host"

end
