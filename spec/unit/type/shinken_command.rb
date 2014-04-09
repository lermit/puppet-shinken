#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:shinken_command) do

  before do
    @class = described_class
    @provider_class = @class.provide(:fake) { mk_resource_methods }
    @provider = @provider_class.new
    @resource = stub 'resource', :resource => nil, :provider => @provider

    @class.stubs(:defaultprovider).returns @provider_class
    @class.any_instance.stubs(:provider).returns @provider
  end

  describe "when validating values" do
    describe "for timeout" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_command", :timeout => "1")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_command", :timeout => "a")}.should raise_error
      end
    end

    describe "for enable_environment_macros" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_command", :enable_environment_macros => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_command", :enable_environment_macros => "1")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_command", :enable_environment_macros => "a")}.should raise_error
      end
    end

  end
end
