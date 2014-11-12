require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::module::retention-mongodb' do

  let(:title) { 'shinken::module::retention-mongodb' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_shinken__module__config('retention-mongodb').with_ensure('present') }

    it { should contain_file('shinken-config-module-retention-mongodb').with_content(/module_type mongodb_retention/) }
    it { should contain_file('shinken-config-module-retention-mongodb').with_content(/module_name retention-mongodb/) }
    it { should contain_file('shinken-config-module-retention-mongodb').with_content(/uri mongodb:\/\/localhost\/\?safe=false/) }
    it { should contain_file('shinken-config-module-retention-mongodb').with_content(/database shinken/) }

    it { should_not contain_file('shinken-config-module-retention-mongodb').with_content(/replica_set/) }
  end

  describe 'Test replica_set args' do
    let(:params) { {
      :replica_set => 'repl42',
    } }
    it { should contain_file('shinken-config-module-retention-mongodb').with_content(/replica_set repl42/) }
  end
end
