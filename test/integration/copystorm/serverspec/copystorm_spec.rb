require 'spec_helper'

describe file('/opt/capstorm/CopyStorm') do
  it { should be_directory }
end

describe file('/opt/capstorm/CopyStorm/CopyStorm.sh') do
  it { should be_file }
  it { should be_executable }
end

describe package('mysql-connector-java') do
  it { should be_installed }
end
