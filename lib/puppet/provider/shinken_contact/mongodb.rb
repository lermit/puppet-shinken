require 'mongo'
require 'puppet/provider/shinken_mongodb'

include Mongo


Puppet::Type.type(:shinken_contact).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  @@shinken_classvars = {

    :collection_name => 'contacts',

    :collection => nil,

    :primary_id => 'contact_name',

    :initialized => false,
  }

  desc "MongoDB provider for shinken_contact"
end
