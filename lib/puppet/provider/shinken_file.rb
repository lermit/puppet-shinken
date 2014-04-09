require 'puppet/provider/shinken'
require 'puppet/util/diff'

include Puppet::Util::Diff

class Puppet::Provider::Shinken_file < Puppet::Provider::Shinken

  # Create all property method
  def create_property_method
    @resource.class.properties.each do |type|
      name = type.name
      self.class.send(:define_method, name) do
        # Ugly but working ...
        value = open(target).grep(/#{name}/)[0].gsub(/\s*\S+\s*(.*)$/, '\1').chomp
      end
      self.class.send(:define_method, "#{name}=") do
      end
    end
  end

  def content
    data = resource_to_data(resource)

    content = "#File managed by puppet\n\n"
    content += "define contact {\n"
    data.each do |option_key, option_value|
      content += "  #{option_key} #{option_value}\n"
    end
    content += "}\n"
    content
  end

  def actual_content
    file = File.open(target, "rb")
    file.read
  end

  def initialize(*args)
    super(*args)
    create_property_method
  end

  def flush
    File.open(tmp_target, 'w') do |f|
      f.write(content)
    end
    diff = diff(target, tmp_target)
    if diff != "" then
      puts diff
    end
    create
  end

  def exists?
    if File.exists?(target)
      true
    else
      false
    end
  end

  def destroy
    debug "Destroy"
    File.delete(target)
  end

  def create
    debug "Create"
    File.open(target, 'w') { |f|
      f.write(content)
    }
  end

  def target
    "#{base_path}/#{resource[:name]}.cfg"
  end

  def tmp_target
    "/tmp/#{resource[:name]}.cfg.tmp"
  end

end
