require 'puppet/provider'

class Puppet::Provider::Shinken < Puppet::Provider

  @@shinken_initialized = false

  # From now this function is not realy usefull cause resource hash and
  # resulting data hash will alway be the same but in the future this method
  # should be used to manage dynamic parameters.
  def resource_to_data(resource)
    data = {}
    @@shinken_classvars[:parameter].each do |name|
      if resource[name]
        data[name] = resource[name]
      else
        # This should be handle by validate method
        fail "Mandatory"
      end
    end

    @@shinken_classvars[:property].each do |name|
      if resource[name]
        data[name] = resource[name]
      end
    end

    data
  end

end
