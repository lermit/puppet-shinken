require 'puppet/type'

Puppet::Type.newtype(:shinken_host) do
  @doc = 'Manage a shinken host'

  ensurable

  newparam(:host_name) do
    isnamevar
    desc "The host name."
  end

  newparam(:alias) do
    desc "The host alias."
  end

  newparam(:address) do
    desc "IP address of the host."
  end

  newparam(:use) do
    desc "Host template for the host."
  end

end
