require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::module::webui' do

  let(:title) { 'shinken::module::webui' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_shinken__module__config('webui').with_ensure('present') }

    it { should contain_file('shinken-config-module-webui').with_content(/module_type webui/) }
    it { should contain_file('shinken-config-module-webui').with_content(/module_name webui/) }
    it { should contain_file('shinken-config-module-webui').with_content(/host 0.0.0.0/) }
    it { should contain_file('shinken-config-module-webui').with_content(/port 7767/) }
    it { should contain_file('shinken-config-module-webui').with_content(/allow_html_output 1/) }
    it { should contain_file('shinken-config-module-webui').with_content(/manage_acl 1/) }
    it { should contain_file('shinken-config-module-webui').with_content(/play_sound 0/) }
    it { should contain_file('shinken-config-module-webui').with_content(/login_text /) }
    it { should contain_file('shinken-config-module-webui').with_content(/refresh_period 60/) }

  end

  describe 'Test modules as list' do
    let(:params) { {
      :modules => [
        'module1',
        'module42',
      ],
    } }
    it { should contain_file('shinken-config-module-webui').with_content(/modules module1,module42/) }
  end
end
