require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::poller', :type => :define do

  let(:facts) { {
    :operatingsystem => 'Debian' ,
    :ipaddress       => '10.42.42.42'
  } }
  let(:title) { 'master' }
  let(:node) { 'rspec.example42.com' }

  describe 'Test standard usage creation' do
    it { should contain_file('shinken-poller-master.cfg').with_path('/etc/shinken/pollers/master.cfg') }
    it { should contain_file('shinken-poller-master.cfg').with_content(/define poller {/) }
    it { should contain_file('shinken-poller-master.cfg').with_content(/address 10.42.42.42/) }
    it { should contain_file('shinken-poller-master.cfg').with_content(/spare 0/) }
    it { should contain_file('shinken-poller-master.cfg').with_content(/manage_sub_realms 0/) }
    it { should contain_file('shinken-poller-master.cfg').with_content(/use_ssl 0/) }
    it { should contain_file('shinken-poller-master.cfg').with_content(/hard_ssl_name_check 0/) }
  end

  describe 'Pass modules list as list' do
  let(:params) { {
    :modules => [
      'module1',
      'module42',
    ],
  } }

    it { should contain_file('shinken-poller-master.cfg').with_content(/modules module1,module42/) }
  end
end
