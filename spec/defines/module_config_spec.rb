require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::module::config', :type => :define do

  let(:facts) { {
    :operatingsystem => 'Debian' ,
    :ipaddress       => '10.42.42.42'
  } }
  let(:title) { 'module42' }
  let(:node) { 'rspec.example42.com' }

  describe 'Test standard usage creation' do
    it { should contain_file('shinken-module-module42.cfg').with_path('/etc/shinken/modules/module42.cfg') }
    it { should contain_file('shinken-module-module42.cfg').with_content(/module_name module42/) }
    it { should contain_file('shinken-module-module42.cfg').with_content(/module_type module42/) }
  end

  describe 'Test config_file options' do
    let(:params) { {
     :config_file => 'my_module.cfg',
    } }
    it { should contain_file('shinken-module-module42.cfg').with_path('/etc/shinken/modules/my_module.cfg') }
  end

  describe 'Test options options' do
    let(:params) { {
      :options => {
        'name42' => 'value42',
      },
    } }

    it { should contain_file('shinken-module-module42.cfg').with_content(/name42 value42/) }
  end

end
