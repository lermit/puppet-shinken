require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_checkmodulation).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do
  confine :feature => :mongo
  confine :shinken_mongo => :true
  defaultfor :shinken_mongo => :true

  def collection_name
    'checkmodulations'
  end

  desc "MongoDB provider for shinken_checkmodulation"

end
