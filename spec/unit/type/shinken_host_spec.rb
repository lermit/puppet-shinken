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

    describe "when flap_detection_options" do
      it "should allow o,d or u" do
        proc { @class.new(:name => "shinken_host", :flap_detection_options => "o")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :flap_detection_options => "d")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :flap_detection_options => "u")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :flap_detection_options => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :flap_detection_options => "t")}.should raise_error
      end
    end

    describe "when notification_options" do
      it "should allow d,u,r,f or s" do
        proc { @class.new(:name => "shinken_host", :notification_options => "d")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notification_options => "u")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notification_options => "r")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notification_options => "f")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notification_options => "s")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :notification_options => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :notification_options => "t")}.should raise_error
      end
    end

    describe "when stalking_options" do
      it "should allow o,d or u" do
        proc { @class.new(:name => "shinken_host", :stalking_options => "o")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :stalking_options => "d")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :stalking_options => "u")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :stalking_options => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :stalking_options => "t")}.should raise_error
      end
    end

    describe "for max_check_attempts" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :max_check_attempts => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :max_check_attempts => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :max_check_attempts => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :max_check_attempts => "t")}.should raise_error
      end
    end

    describe "for check_interval" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :check_interval => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :check_interval => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :check_interval => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :check_interval => "t")}.should raise_error
      end
    end

    describe "for retry_interval" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :retry_interval => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :retry_interval => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :retry_interval => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :retry_interval => "t")}.should raise_error
      end
    end

    describe "for freshness_threshold" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :freshness_threshold => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :freshness_threshold => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :freshness_threshold => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :freshness_threshold => "t")}.should raise_error
      end
    end

    describe "for low_flap_threshold" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :low_flap_threshold => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :low_flap_threshold => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :low_flap_threshold => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :low_flap_threshold => "t")}.should raise_error
      end
    end

    describe "for high_flap_threshold" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :high_flap_threshold => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :high_flap_threshold => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :high_flap_threshold => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :high_flap_threshold => "t")}.should raise_error
      end
    end

    describe "for notification_interval" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :notification_interval => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notification_interval => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :notification_interval => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :notification_interval => "t")}.should raise_error
      end
    end

    describe "for first_notification_delay" do
      it "should allow number" do
        proc { @class.new(:name => "shinken_host", :first_notification_delay => "1")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :first_notification_delay => "10")}.should_not raise_error
      end

      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :first_notification_delay => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :first_notification_delay => "t")}.should raise_error
      end
    end

    describe "for active_checks_enabled" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :active_checks_enabled => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :active_checks_enabled => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :active_checks_enabled => "a")}.should raise_error
      end
    end

    describe "for passive_checks_enabled" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :passive_checks_enabled => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :passive_checks_enabled => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :passive_checks_enabled => "a")}.should raise_error
      end
    end

    describe "for obsess_over_host" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :obsess_over_host => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :obsess_over_host => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :obsess_over_host => "a")}.should raise_error
      end
    end

    describe "for check_freshness" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :check_freshness => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :check_freshness => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :check_freshness => "a")}.should raise_error
      end
    end

    describe "for event_handler_enabled" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :event_handler_enabled => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :event_handler_enabled => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :event_handler_enabled => "a")}.should raise_error
      end
    end

    describe "for flap_detection_enabled" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :flap_detection_enabled => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :flap_detection_enabled => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :flap_detection_enabled => "a")}.should raise_error
      end
    end

    describe "for process_perf_data" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :process_perf_data => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :process_perf_data => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :process_perf_data => "a")}.should raise_error
      end
    end

    describe "for retain_status_information" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :retain_status_information => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :retain_status_information => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :retain_status_information => "a")}.should raise_error
      end
    end

    describe "for retain_nonstatus_information" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :retain_nonstatus_information => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :retain_nonstatus_information => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :retain_nonstatus_information => "a")}.should raise_error
      end
    end

    describe "for notifications_enabled" do
      it "should allow 0 ou 1" do
        proc { @class.new(:name => "shinken_host", :notifications_enabled => "0")}.should_not raise_error
        proc { @class.new(:name => "shinken_host", :notifications_enabled => "1")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :notifications_enabled => "a")}.should raise_error
      end
    end

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

    describe "for second_coords" do
      it "should allow 0,1,2,3,4 or 5" do
        proc { @class.new(:name => "shinken_host", :second_coords => "300,300")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :second_coords => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :second_coords => "1,2,3")}.should raise_error
      end
    end

    describe "for third_coords" do
      it "should allow 0,1,2,3,4 or 5" do
        proc { @class.new(:name => "shinken_host", :third_coords => "300,300,300")}.should_not raise_error
      end
      it "should not allow anything else" do
        proc { @class.new(:name => "shinken_host", :third_coords => "a")}.should raise_error
        proc { @class.new(:name => "shinken_host", :third_coords => "1,2")}.should raise_error
        proc { @class.new(:name => "shinken_host", :third_coords => "1,2,3,4")}.should raise_error
      end
    end




  end
end
