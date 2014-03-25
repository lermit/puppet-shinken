Puppet::Type.type(:shinken_package).provide(:shinken_io) do
  desc "shinken_package provider from shinken.io"

  commands :shinken => "shinken"

  def create
    self.debug("Install shinken package #{resource[:name]}")
    output = shinken "install", resource[:name]
    if self.exists?
      true
    else
      self.err("Cannot install #{resource[:name]} shinen package")
      self.err(output)
      false
    end
  end

  def destroy
  end

  def exists?
    package_list = shinken("inventory")
    self.debug("Installed shinken package : #{package_list}")
    if package_list =~ /#{resource[:name]}/
      self.debug("#{resource[:name]} is already installed")
      true
    else
      self.debug("#{resource[:name]} is not already installed")
      false
    end
  end
end
