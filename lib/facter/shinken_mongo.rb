Facter.add("shinken_mongo") do
  setcode do
    if File.file?('/etc/shinken/arbiters/arbiter-master.cfg') and File.open('/etc/shinken/arbiters/arbiter-master.cfg').read() =~ /^\s*module[^#]*Mongodb/
      true
    else
      false
    end
  end
end
