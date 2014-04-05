require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_contact).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  @@shinken_classvars = {
    :collection_name => 'contacts',
    :primary_id => 'contact_name',
  }

  desc "MongoDB provider for shinken_contact"
end
