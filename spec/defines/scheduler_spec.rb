require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::scheduler', :type => :define do

  let(:facts) { {
    :operatingsystem => 'Debian' ,
    :ipaddress       => '10.42.42.42'
  } }
  let(:title) { 'master' }
  let(:node) { 'rspec.example42.com' }

  describe 'Test standard usage creation' do
    it { should contain_file('shinken-scheduler-master.cfg').with_path('/etc/shinken/schedulers/master.cfg') }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/define scheduler {/) }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/address 10.42.42.42/) }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/spare 0/) }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/use_ssl 0/) }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/hard_ssl_name_check 0/) }
    it { should contain_file('shinken-scheduler-master.cfg').with_content(/skip_initial_broks 0/) }
  end

  describe 'Pass modules list as list' do
  let(:params) { {
    :modules => [
      'module1',
      'module42',
    ],
  } }

    it { should contain_file('shinken-scheduler-master.cfg').with_content(/modules module1,module42/) }
  end

  describe 'Pass satellitemap as list' do
  let(:params) { {
    :satellitemap => [
      'sat1',
      'sat42',
    ],
  } }

    it { should contain_file('shinken-scheduler-master.cfg').with_content(/satellitemap sat1,sat42/) }
  end
end
