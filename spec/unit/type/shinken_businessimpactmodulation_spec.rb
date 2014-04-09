#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:shinken_businessimpactmodulation) do

  before do
    @class = described_class
    @provider_class = @class.provide(:fake) { mk_resource_methods }
    @provider = @provider_class.new
    @resource = stub 'resource', :resource => nil, :provider => @provider

    @class.stubs(:defaultprovider).returns @provider_class
    @class.any_instance.stubs(:provider).returns @provider
  end

  describe "when validating values" do
    describe "for business_impact" do
      it "should allow 0,1,2,3,4 or 5" do
        proc { @class.new(:name => "shinken_host", :business_impact => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :business_impact => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :business_impact => "2")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :business_impact => "3")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :business_impact => "4")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :business_impact => "5")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :business_impact => "a")}.should raise_error
      end
    end
  end
end
