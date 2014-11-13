require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'shinken::install', :type => :define do

  let(:facts) { {
    :operatingsystem => 'Debian' ,
    :ipaddress       => '10.42.42.42'
  } }
  let(:title) { 'module42' }
  let(:node) { 'rspec.example42.com' }

  describe 'Test standard usage' do
    it { should contain_package('module42').with_name('module42') }
    it { should contain_package('module42').with_require('File[shinken.ini]') }
    it { should contain_package('module42').with_provider('shinken') }
  end

end
