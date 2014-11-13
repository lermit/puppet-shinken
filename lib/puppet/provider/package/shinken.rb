# Puppet package provider for Shinken module management.

require 'puppet/provider/package'

Puppet::Type.type(:package).provide :shinken,
  :parent => ::Puppet::Provider::Package do

  desc "Shinken modules packages via `shinken`."

  has_feature :installable

  # Parse lines of output from shinken 'shinken inventory' which are structured
  # as _package_ (yes, simple enough !)
  def self.parse(line)
    if line.chomp =~ /^(.+)$/
      {:ensure => 'present', :name => $1, :provider => name}
    else
      nil
    end
  end

  # Return an array of strutured information about every installed package
  # that's managed by `shinken`.
  # If shinken command is not installed return empty array.
  def self.instances
    packages = []
    shinken_cmd = which("shinken") or return []
    execpipe "#{shinken_cmd} inventory" do |process|
      process.collect do |line|
        next unless options = parse(line)
        packages << new(options)
      end
    end
    packages
  end

  # Return structured information about a particular package or `nil`if it is
  # not installed or `shinken`itself is not available.
  def query
    self.class.instances.each do |provider_shinken|
      return provider_shinken.properties if @resource[:name].downcase == provider_shinken.name.downcase
    end
    return nil
  end

  # Install a package.
  def install
    lazy_shinken "install #{@resource[:name]}"
  end

  private
  def lazy_shinken(*args)
    shinken *args
  rescue NoMethodError => e
    if pathname = which('shinken')
      self.class.commands :shinken => pathname
      shinken *args
    else
      raise e, 'Could not locate the shinken commande.', e.backtrace
    end
  end
end
