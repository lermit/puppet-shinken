require 'puppet/type'

Puppet::Type.newtype(:shinken_host) do
  @doc = 'Manage a shinken host'

  ensurable

  newparam(:host_name) do
    isnamevar
    desc "The host name."
  end

  newproperty(:alias) do
    desc "The host alias."
  end

  newproperty(:address) do
    desc "IP address of the host."
  end

  newproperty(:use) do
    desc "Host template for the host."
  end

  newproperty(:display_name) do
    desc "display_name parameter"
  end

  newproperty(:parents) do
    desc "parents parameter"
  end

  newproperty(:hostgroups) do
    desc "hostgroups parameter"
  end

  newproperty(:check_command) do
    desc "check_command parameter"
  end

  newproperty(:initial_state) do
    desc "initial_state parameter"
    validate do |value|
      unless value =~ /^(o|d|u)$/
        raise ArgumentError, "Only o,d or u is a valid initial state"
      end
    end
  end

  newproperty(:max_check_attempts) do
    desc "max_check_attempts parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:check_interval) do
    desc "check_interval parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:retry_interval) do
    desc "retry_interval parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:active_checks_enabled) do
    desc "active_checks_enabled parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:passive_checks_enabled) do
    desc "passive_checks_enabled parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:check_period) do
    desc "check_period parameter"
  end

  newproperty(:obsess_over_host) do
    desc "obsess_over_host parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:check_freshness) do
    desc "check_freshness parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:freshness_threshold) do
    desc "freshness_threshold parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:event_handler) do
    desc "event_handler parameter"
  end

  newproperty(:event_handler_enabled) do
    desc "event_handler_enabled parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:low_flap_threshold) do
    desc "low_flap_threshold parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:high_flap_threshold) do
    desc "high_flap_threshold parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:flap_detection_enabled) do
    desc "flap_detection_enabled parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:flap_detection_options) do
    desc "flap_detection_options parameter"
  end

  newproperty(:process_perf_data) do
    desc "process_perf_data parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:retain_status_information) do
    desc "retain_status_information parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:retain_nonstatus_information) do
    desc "retain_nonstatus_information parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:contacts) do
    desc "contacts parameter"
  end

  newproperty(:contact_groups) do
    desc "contact_groups parameter"
  end

  newproperty(:notification_interval) do
    desc "notification_interval parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:first_notification_delay) do
    desc "first_notification_delay parameter"
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:notification_period) do
    desc "notification_period parameter"
  end

  newproperty(:notification_options) do
    desc "notification_options parameter"
  end

  newproperty(:notifications_enabled) do
    desc "notifications_enabled parameter"
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

  newproperty(:stalking_options) do
    desc "stalking_options parameter"
  end

  newproperty(:notes) do
    desc "notes parameter"
  end

  newproperty(:notes_url) do
    desc "notes_url parameter"
  end

  newproperty(:action_url) do
    desc "action_url parameter"
  end

  newproperty(:icon_image) do
    desc "icon_image parameter"
  end

  newproperty(:icon_image_alt) do
    desc "icon_image_alt parameter"
  end

  newproperty(:icon_set) do
    desc "icon_set parameter"
  end

  newproperty(:vrml_image) do
    desc "vrml_image parameter"
  end

  newproperty(:statusmap_image) do
    desc "statusmap_image parameter"
  end

  newproperty(:second_coords) do
    desc "2d_coords parameter"
  end

  newproperty(:third_coords) do
    desc "3d_coords parameter"
  end

  newproperty(:failure_prediction_enabled) do
    desc "failure_prediction_enabled parameter"
  end

  newproperty(:realm) do
    desc "realm parameter"
  end

  newproperty(:poller_tag) do
    desc "poller_tag parameter"
  end

  newproperty(:reactionner_tag) do
    desc "reactionner_tag parameter"
  end

  newproperty(:resultmodulations) do
    desc "resultmodulations parameter"
  end

  newproperty(:business_impact_modulations) do
    desc "business_impact_modulations parameter"
  end

  newproperty(:escalations) do
    desc "escalations parameter"
  end

  newproperty(:maintenance_period) do
    desc "maintenance_period parameter"
  end

  newproperty(:time_to_orphanage) do
    desc "time_to_orphanage parameter"
  end

  newproperty(:service_overrides) do
    desc "service_overrides parameter"
  end

  newproperty(:service_excludes) do
    desc "service_excludes parameter"
  end

  newproperty(:labels) do
    desc "labels parameter"
  end

  newproperty(:business_rule_output_template) do
    desc "business_rule_output_template parameter"
  end

  newproperty(:business_rule_smart_notifications) do
    desc "business_rule_smart_notifications parameter"
  end

  newproperty(:business_rule_downtime_as_ack) do
    desc "business_rule_downtime_as_ack parameter"
  end

  newproperty(:business_rule_host_notification_options) do
    desc "business_rule_host_notification_options parameter"
  end

  newproperty(:business_rule_service_notification_options) do
    desc "business_rule_service_notification_options parameter"
  end

  newproperty(:business_impact) do
    desc "business_impact parameter"
  end

  newproperty(:trigger) do
    desc "trigger parameter"
  end

  newproperty(:trigger_name) do
    desc "trigger_name parameter"
  end

  newproperty(:trending_policies) do
    desc "trending_policies parameter"
  end

  newproperty(:checkmodulations) do
    desc "checkmodulations parameter"
  end

  newproperty(:macromodulations) do
    desc "macromodulations parameter"
  end

  newproperty(:custom_views) do
    desc "custom_views parameter"
  end


end
