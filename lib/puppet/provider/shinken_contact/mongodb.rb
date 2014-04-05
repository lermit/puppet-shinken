require 'mongo'
require 'puppet/provider/shinken_mongodb'

include Mongo


Puppet::Type.type(:shinken_contact).provide :mongodb, :parent => Puppet::Provider::Shinken_mongodb do

  @@shinken_classvars = {

    :parameter => [
      'contact_name',
    ],

    :property => [
      'alias',
      'contactgroups',
      'host_notifications_enabled',
      'service_notifications_enabled',
      'host_notification_period',
      'service_notification_period',
      'host_notification_options',
      'service_notification_options',
      'host_notification_commands',
      'service_notification_commands',
      'email',
      'pager',
      'addressx',
      'can_submit_commands',
      'is_admin',
      'retain_status_information',
      'retain_nonstatus_information',
      'min_business_impact',
      'use',
    ],

    :collection_name => 'contacts',

    :collection => nil,

    :primary_id => 'contact_name',

    :initialized => false,
  }

  desc "MongoDB provider for shinken_contact"
end
