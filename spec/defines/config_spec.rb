require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::config', :type => :define do

  let(:facts) { {
    :operatingsystem => 'Debian' ,
    :ipaddress       => '10.42.42.42'
  } }
  let(:title) { 'module/path.cfg' }
  let(:node) { 'rspec.example42.com' }
  let(:params) { {
    :type => 'module',
  } }

  describe 'Test standard usage creation' do
    it { should contain_file('shinken-config-module/path.cfg').with_path('/etc/shinken/module/path.cfg') }
    it { should contain_file('shinken-config-module/path.cfg').with_ensure('present') }
    it { should contain_file('shinken-config-module/path.cfg').with_mode('0644') }
    it { should contain_file('shinken-config-module/path.cfg').with_owner('shinken') }
    it { should contain_file('shinken-config-module/path.cfg').with_group('shinken') }
    it { should contain_file('shinken-config-module/path.cfg').with_notify('Service[shinken-arbiter]') }
    it { should contain_file('shinken-config-module/path.cfg').with_require('Package[shinken]') }
    it { should contain_file('shinken-config-module/path.cfg').with_replace('true') }
    it { should contain_file('shinken-config-module/path.cfg').with_audit(nil) }
    it { should contain_file('shinken-config-module/path.cfg').with_noop('false') }
  end

  describe 'Test config_file options' do
    let(:facts) { {
      :shinken_service_autorestart => false
    } }
    it { should contain_file('shinken-config-module/path.cfg').with_notify(nil) }
  end

  describe 'Test options options' do
    let(:params) { {
      :type    => 'module',
      :options => {
        'name42' => 'value42',
      },
    } }

    it { should contain_file('shinken-config-module/path.cfg').with_content(/name42 value42/) }
  end

end
