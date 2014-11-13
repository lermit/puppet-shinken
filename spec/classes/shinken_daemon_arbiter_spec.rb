require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken' do

  let(:title) { 'shinken::daemon::arbiter' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_service('shinken-arbiter').with_ensure('running') }
    it { should contain_service('shinken-arbiter').with_name('shinken-arbiter') }
    it { should contain_service('shinken-arbiter').with_enable(true) }

    it { should contain_file('shinken-arbiter.conf').with_ensure('present') }
    it { should contain_file('shinken-arbiter.conf').with_path('/etc/shinken/shinken.cfg') }
    it { should contain_file('shinken-arbiter.conf').with_notify('Service[shinken-arbiter]') }
    it { should contain_file('shinken-arbiter.conf').with_content(/daemon_enabled=/) }
  end
end
