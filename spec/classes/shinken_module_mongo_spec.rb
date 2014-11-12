require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::module::mongodb' do

  let(:title) { 'shinken::module::mongodb' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_shinken__module__config('mongodb').with_ensure('present') }

    it { should contain_file('shinken-config-module-mongodb').with_content(/module_type mongodb/) }
    it { should contain_file('shinken-config-module-mongodb').with_content(/module_name mongodb/) }
    it { should contain_file('shinken-config-module-mongodb').with_content(/uri mongodb:\/\/localhost\/\?safe=false/) }
    it { should contain_file('shinken-config-module-mongodb').with_content(/database shinken/) }

    it { should_not contain_file('shinken-config-module-mongodb').with_content(/username/) }
    it { should_not contain_file('shinken-config-module-mongodb').with_content(/password/) }
    it { should_not contain_file('shinken-config-module-mongodb').with_content(/replica_set/) }
  end

  describe 'Test username/password args' do
    let(:params) { {
      :username => 'user42',
      :password => 'pass42',
    } }
    it { should contain_file('shinken-config-module-mongodb').with_content(/username user42/) }
    it { should contain_file('shinken-config-module-mongodb').with_content(/password pass42/) }
  end

  describe 'Test replica_set args' do
    let(:params) { {
      :replica_set => 'repl42',
    } }
    it { should contain_file('shinken-config-module-mongodb').with_content(/replica_set repl42/) }
  end
end
