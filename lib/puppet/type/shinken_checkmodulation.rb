Puppet::Type.newtype(:shinken_checkmodulation) do
  @doc = "Shinken checkmodulation"

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:checkmodulation_name) do
    isnamevar
  end

  newproperty(:check_command) do
  end

  newproperty(:check_period) do
  end

end
