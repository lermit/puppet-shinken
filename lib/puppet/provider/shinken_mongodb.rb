require 'puppet/provider/shinken'
require 'mongo'

include Mongo

class Puppet::Provider::Shinken_mongodb < Puppet::Provider::Shinken

  @@collection = nil

  # Connect a Mongodb collection and store connection into @@collection
  def connect
    debug "MongoDB connection to #{@@shinken_classvars[:collection_name]} collection"
    @@collection =
      MongoClient.new.db(
        'shinken'
      ).collection(
        @@shinken_classvars[:collection_name]
      )
  end

  # Retrun a dict use for search current object
  def get_search_query
    {
      @@shinken_classvars[:primary_id] => "#{resource[@@shinken_classvars[:primary_id]]}"
    }
  end

  # Get an value of current object
  def get_value(name)
    @@collection.find_one(get_search_query)["#{name}"]
  end

  # Set a value for current object
  # TODO use flush method
  def set_value(name, value)
    @@collection.update(
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
      self.class.send(:define_method, "#{name}=") do
        set_value(name,resource[name])
      end
    end
  end

  def initialize(*args)
    debug "Initialize shinken mongodb provider"
    super(*args)

    if not @@shinken_initialized

      # First connect to mongodb
      connect

      # Create puppet property method in order to allow retreiving and
      # modification
      create_property_method

      # Store state
      @@shinken_initialized = true
    end

  end

  def exists?
    nb = @@collection.find({
      @@shinken_classvars[:primary_id] => resource[@@shinken_classvars[:primary_id]]
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
    @@collection.remove({
      @@shinken_classvars[:primary_id] => "#{@resource[@@shinken_classvars[:primary_id]]}"
    })
  end

  def create
    debug "Create"
    data = resource_to_data(resource)
    @@collection.insert(data)
  end

end
