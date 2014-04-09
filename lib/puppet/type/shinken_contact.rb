Puppet::Type.newtype(:shinken_contact) do
  @doc = "Shinken contact"

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:contact_name) do
    desc "This directive is used to define a short name used to identify the contact. It is referenced in contact group definitions. Under the right circumstances, the $CONTACTNAME$ macro will contain this value."

    validate do |value|
      # Here we could find if name contain a path or 'git:' in order to change
      # default provider
      resource[:provider] = :file
    end

    isnamevar
  end

  newproperty(:use) do
    defaultto "generic-contact"
  end

  newproperty(:alias) do
  end

  newproperty(:contactgroups) do
  end

  newproperty(:host_notifications_enabled) do
  end

  newproperty(:service_notifications_enabled) do
  end

  newproperty(:host_notification_period) do
  end

  newproperty(:service_notification_period) do
  end

  newproperty(:host_notification_options) do
  end

  newproperty(:service_notification_options) do
  end

  newproperty(:host_notification_commands) do
  end

  newproperty(:service_notification_commands) do
  end

  newproperty(:email) do
  end

  newproperty(:pager) do
  end

  newproperty(:address1) do
  end

  newproperty(:address2) do
  end

  newproperty(:address3) do
  end

  newproperty(:address4) do
  end

  newproperty(:address5) do
  end

  newproperty(:address5) do
  end

  newproperty(:can_submit_commands) do
  end

  newproperty(:is_admin) do
  end

  newproperty(:retain_status_information) do
  end

  newproperty(:min_business_impact) do
  end

  newproperty(:notificationways) do
  end

  newproperty(:password) do
  end


end
