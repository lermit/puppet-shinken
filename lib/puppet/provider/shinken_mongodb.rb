require 'puppet/provider/shinken'
require 'mongo' if Puppet.features.mongo?

include Mongo

class Puppet::Provider::Shinken_mongodb < Puppet::Provider::Shinken
  confine :feature => :mongo

  @@collection = nil

  def collection
    if @@collection == nil
      debug "Connect to MongoDB server"
      # Connect a Mongodb collection and store connection into @@collection
      @@collection = MongoClient.new.db('shinken').collection(collection_name)
    end
    @@collection
  end

  # Retrun a dict use for search current object
  def get_search_query
    {
      '_id' => "#{resource[:name]}"
    }
  end

  # Get an value of current object
  def get_value(name)
    collection.find_one(get_search_query)["#{name}"]
  end

  # Set a value for current object
  # TODO use flush method
  def set_value(name, value)
    collection.update(
      get_search_query,
      { "$set" => { name => value }}
    )
  end

  # Create all property method
  def create_property_method
    @resource.class.properties.each do |type|
      name = type.name
      self.class.send(:define_method, name) do
        get_value(name)
      end
      self.class.send(:define_method, "#{name}=") do |value|
        set_value(name,resource[name])
      end
    end
  end

  def initialize(*args)
    super(*args)

    debug "Initialize shinken mongodb provider"

    # Create puppet property method in order to allow retreiving and
    # modification
    create_property_method
  end

  def exists?
    nb = collection.find({
      '_id' => resource[:name]
    }).count
    if nb == 1
      true
    elsif nb == 0
      false
    else
      warn "Data exist more than one time in mongodb database"
      true
    end
  end

  def destroy
    debug "Destroy"
    collection.remove({
      '_id' => "#{@resource[:name]}"
    })
  end

  def create
    debug "Create"
    data = resource_to_data(resource)
    data['_id'] = resource[:name]
    collection.insert(data)
  end

end
