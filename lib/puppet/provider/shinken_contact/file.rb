Puppet::Type.type(:shinken_contact).provide(:file) do

  def target_content
    target_content = "#File managed by puppet\n\n"
    target_content += "define contact {\n"
    target_content += "  contact_name #{resource[:contact_name]}\n"
    if resource[:alias]
      target_content += "  alias #{resource[:alias]}\n"
    end
    if resource[:contactgroups]
      target_content += "  contactgroups #{resource[:contactgroups]}\n"
    end
    if resource[:host_notifications_enabled]
      target_content += "  host_notifications_enabled #{resource[:host_notifications_enabled]}\n"
    end
    if resource[:service_notifications_enabled]
      target_content += "  service_notifications_enabled #{resource[:service_notifications_enabled]}\n"
    end
    if resource[:host_notification_period]
      target_content += "  host_notification_period #{resource[:host_notification_period]}\n"
    end
    if resource[:service_notification_period]
      target_content += "  service_notification_period #{resource[:service_notification_period]}\n"
    end
    if resource[:host_notification_options]
      target_content += "  host_notification_options #{resource[:host_notification_options]}\n"
    end
    if resource[:service_notification_options]
      target_content += "  service_notification_options #{resource[:service_notification_options]}\n"
    end
    if resource[:host_notification_commands]
      target_content += "  host_notification_commands #{resource[:host_notification_commands]}\n"
    end
    if resource[:service_notification_commands]
      target_content += "  service_notification_commands #{resource[:service_notification_commands]}\n"
    end
    if resource[:email]
      target_content += "  email #{resource[:email]}\n"
    end
    if resource[:pager]
      target_content += "  pager #{resource[:pager]}\n"
    end
    if resource[:addressx]
      target_content += "  addressx #{resource[:addressx]}\n"
    end
    if resource[:can_submit_commands]
      target_content += "  can_submit_commands #{resource[:can_submit_commands]}\n"
    end
    if resource[:is_admin]
      target_content += "  is_admin #{resource[:is_admin]}\n"
    end
    if resource[:retain_status_information]
      target_content += "  retain_status_information #{resource[:retain_status_information]}\n"
    end
    if resource[:retain_nonstatus_information]
      target_content += "  retain_nonstatus_information #{resource[:resource]}\n"
    end
    if resource[:min_business_impact]
      target_content += "  min_business_impact #{resource[:min_business_impact]}\n"
    end
    if resource[:use]
      target_content += "  use #{resource[:use]}\n"
    end
    target_content += "}\n"
    target_content
  end

  def target
    "/etc/shinken/contacts/#{resource[:contact_name]}.cfg"
  end


  def create
    self.debug("Create shinken contact : #{resource[:name]}")

    File.open(target, 'w') { |f|
      f.write(target_content)
    }
  end

  def destroy
    File.delete(target)
  end

  def exists?
    if File.exists?(target)
      file = File.open(target, "rb")
      contents = file.read
      contents.eql?target_content
    else
      false
    end
  end
end
