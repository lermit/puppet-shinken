require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::daemon::poller' do

  let(:title) { 'shinken::daemon::poller' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_service('shinken-poller').with_ensure('running') }
    it { should contain_service('shinken-poller').with_name('shinken-poller') }
    it { should contain_service('shinken-poller').with_enable(true) }

    it { should contain_file('shinken-poller.conf').with_ensure('present') }
    it { should contain_file('shinken-poller.conf').with_path('/etc/shinken/daemons/pollerd.ini') }
    it { should contain_file('shinken-poller.conf').with_notify('Service[shinken-poller]') }
    it { should contain_file('shinken-poller.conf').with_content(/daemon_enabled=/) }
  end
end
