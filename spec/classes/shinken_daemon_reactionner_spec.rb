require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::daemon::reactionner' do

  let(:title) { 'shinken::daemon::reactionner' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_service('shinken-reactionner').with_ensure('running') }
    it { should contain_service('shinken-reactionner').with_name('shinken-reactionner') }
    it { should contain_service('shinken-reactionner').with_enable(true) }

    it { should contain_file('shinken-reactionner.conf').with_ensure('present') }
    it { should contain_file('shinken-reactionner.conf').with_path('/etc/shinken/daemons/reactionnerd.ini') }
    it { should contain_file('shinken-reactionner.conf').with_notify('Service[shinken-reactionner]') }
    it { should contain_file('shinken-reactionner.conf').with_content(/daemon_enabled=/) }
  end
end
