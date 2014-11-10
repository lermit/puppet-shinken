require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::daemon::broker' do

  let(:title) { 'shinken::daemon::broker' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_service('shinken-broker').with_ensure('running') }
    it { should contain_service('shinken-broker').with_name('shinken-broker') }
    it { should contain_service('shinken-broker').with_enable(true) }

    it { should contain_file('shinken-broker.conf').with_ensure('present') }
    it { should contain_file('shinken-broker.conf').with_path('/etc/shinken/daemons/brokerd.ini') }
    it { should contain_file('shinken-broker.conf').with_notify('Service[shinken-broker]') }
    it { should contain_file('shinken-broker.conf').with_content(/daemon_enabled=/) }
  end
end
