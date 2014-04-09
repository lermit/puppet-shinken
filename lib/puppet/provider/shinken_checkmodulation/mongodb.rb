require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_checkmodulation).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  def collection_name
    'checkmodulations'
  end

  desc "MongoDB provider for shinken_checkmodulation"

end
