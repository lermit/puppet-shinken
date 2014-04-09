#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:shinken_host) do

  before do
    @class = described_class
    @provider_class = @class.provide(:fake) { mk_resource_methods }
    @provider = @provider_class.new
    @resource = stub 'resource', :resource => nil, :provider => @provider

    @class.stubs(:defaultprovider).returns @provider_class
    @class.any_instance.stubs(:provider).returns @provider
  end

  describe "when validating values" do
    describe "for initial_state" do

      it "should allow o,d or u" do
        proc { @class.new(:name => "shinken_host", :initial_state => "o")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :initial_state => "d")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :initial_state => "u")}.should_not raise_error
      end

      it "should not allow anything else then o,d or u" do
        proc { @class.new(:name => "shinken_host", :initial_state => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :initial_state => "t")}.should raise_error
        proc { @class.new(:name => "shinken_host", :initial_state => "w")}.should raise_error
      end


    end
  end
end
