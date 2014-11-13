Facter.add("shinken_mongo_uri") do
  setcode do
    ret = nil
    if File.file?('/etc/shinken/modules/mongodb.cfg')
      File.foreach('/etc/shinken/modules/mongodb.cfg') do |line|
        if line.strip =~ /uri\s+(.*)/
          ret = $1
        end
      end
    end
    ret
  end
end
