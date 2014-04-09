require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_businessimpactmodulation).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  def collection_name
    'businessimpactmodulation'
  end

  desc "MongoDB provider for shinken_businessimpactmodulation"
end
