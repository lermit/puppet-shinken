Puppet::Type.newtype(:shinken_command) do
  @doc = "Shinken command"

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:command_name) do
    isnamevar
  end

  newproperty(:command_line) do
  end

  newproperty(:poller_tag) do
  end

  newproperty(:reactionner_tag) do
  end

  newproperty(:module_type) do
  end

  newproperty(:timeout) do
    validate do |value|
      unless value =~ /^\d+$/
        raise ArgumentError, "Only number is allow"
      end
    end
  end

  newproperty(:enable_environment_macros) do
    validate do |value|
      unless value =~ /^(0|1)$/
        raise ArgumentError, "Only 0 or 1 is allow"
      end
    end
  end

end
