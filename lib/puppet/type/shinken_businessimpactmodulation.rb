Puppet::Type.newtype(:shinken_businessimpactmodulation) do
  @doc = "Shinken businessimpactmodulation"

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:business_impact_modulation_name) do
    isnamevar
  end

  newproperty(:business_impact) do
    validate do |value|
      unless value =~ /^(0|1|2|3|4|5)$/
        raise ArgumentError, "Only 0,1,2,3,4 or 5 is a valid business impact value"
      end
    end
  end

  newproperty(:modulation_period) do
  end

end
