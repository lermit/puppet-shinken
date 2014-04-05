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

end
