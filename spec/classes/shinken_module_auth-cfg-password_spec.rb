require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::module::auth-cfg-password' do

  let(:title) { 'shinken::module::auth-cfg-password' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_shinken__module__config('auth-cfg-password').with_ensure('present') }

    it { should contain_file('shinken-config-module-auth-cfg-password').with_content(/module_type cfg_password_webui/) }
    it { should contain_file('shinken-config-module-auth-cfg-password').with_content(/module_name auth-cfg-password/) }
  end
end
