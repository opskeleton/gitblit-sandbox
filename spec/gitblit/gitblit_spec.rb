require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('gitblit') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8443) do
  it { should be_listening }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  its(:content) { should match /ServerName default/ }
end
