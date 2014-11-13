require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken' do

  let(:title) { 'shinken::daemon::scheduler' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_service('shinken-scheduler').with_ensure('running') }
    it { should contain_service('shinken-scheduler').with_name('shinken-scheduler') }
    it { should contain_service('shinken-scheduler').with_enable(true) }

    it { should contain_file('shinken-scheduler.conf').with_ensure('present') }
    it { should contain_file('shinken-scheduler.conf').with_path('/etc/shinken/daemons/schedulerd.ini') }
    it { should contain_file('shinken-scheduler.conf').with_notify('Service[shinken-scheduler]') }
    it { should contain_file('shinken-scheduler.conf').with_content(/daemon_enabled=/) }
  end
end
