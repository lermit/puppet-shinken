require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_contact).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  def collection_name
    'contacts'
  end

  desc "MongoDB provider for shinken_contact"
end
