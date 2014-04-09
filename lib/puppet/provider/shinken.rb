require 'puppet/provider'

class Puppet::Provider::Shinken < Puppet::Provider

  # Convert ressource to an hash
  def resource_to_data(resource)
    data = {}

    resource.parameters.each do |name|
      name = name[0]
      next if [:ensure,:provider,:loglevel].include?(name)
      if resource[name]
        data[name] = resource[name]
      end
    end

    data
  end

end
