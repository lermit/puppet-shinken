require 'puppetlabs_spec_helper/module_spec_helper'
if ENV["TRAVIS"] && RUBY_VERSION.to_f >= 1.9
  require 'coveralls'
  Coveralls.wear!
end
