require 'mongo'

include Mongo

def get_collection(name)
  db = MongoClient.new.db('shinken')
  db.collection( name )
end

Puppet::Type.type(:shinken_host).provide :mongodb, :parent => Puppet::Provider do


  desc "MongoDB provider for shinken_host"

  commands :mongo => 'mongo'
  commands :echa => 'echo'

  def create
    debug "Create"
    get_collection('hosts').insert({
      'host_name' => "#{@resource[:host_name]}"
    })
  end

  def destroy
    debug "Destroy"
    get_collection('hosts').remove({
      'host_name' => "#{@resource[:host_name]}"
    })
  end

  def exists?
    debug "Test existence"
    out = mongo('shinken', '--quiet', '--eval', "db.hosts.find({host_name:\"#{@resource[:host_name]}\"}).count()").strip
    if out == "1"
      debug "Host with host_name: #{@resource[:host_name]} exist"
      true
    elsif out == "0"
      debug "Host with host_name: #{@resource[:host_name]} does not exist"
      false
    else
      warn "There is #{out} host with #{@resource[:host_name]} as host_name"
      true
    end
  end


end
