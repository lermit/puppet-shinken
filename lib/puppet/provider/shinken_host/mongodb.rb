require 'puppet/provider/shinken_mongodb'

Puppet::Type.type(:shinken_host).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  @@shinken_classvars = {
    :collection_name => 'hosts',
    :primary_id => 'host_name',
  }

  desc "MongoDB provider for shinken_host"

end
