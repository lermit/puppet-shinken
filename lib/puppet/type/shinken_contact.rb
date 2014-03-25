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

  newparam(:use) do
    defaultto "generic-contact"
  end

  newparam(:alias) do
  end

  newparam(:contactgroups) do
  end

  newparam(:host_notifications_enabled) do
  end

  newparam(:service_notifications_enabled) do
  end

  newparam(:host_notification_period) do
  end

  newparam(:service_notification_period) do
  end

  newparam(:host_notification_options) do
  end

  newparam(:service_notification_options) do
  end

  newparam(:host_notification_commands) do
  end

  newparam(:service_notification_commands) do
  end

  newparam(:email) do
  end

  newparam(:pager) do
  end

  newparam(:addressx) do
  end

  newparam(:can_submit_commands) do
  end

  newparam(:is_admin) do
  end

  newparam(:retain_status_information) do
  end

  newparam(:retain_nonstatus_information) do
  end

  newparam(:min_business_impact) do
  end

end
