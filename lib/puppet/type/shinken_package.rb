Puppet::Type.newtype(:shinken_package) do
  @doc = "Manage shinken package"

  ensurable do
    defaultvalues
    defaultto :present
  end


  newparam(:name) do
    desc <<-EOT
      The name of the shinken package to install.
    EOT

    validate do |value|
      # Here we could find if name contain a path or 'git:' in order to change
      # default provider
      resource[:provider] = :shinken_io
    end

    isnamevar
  end

end
