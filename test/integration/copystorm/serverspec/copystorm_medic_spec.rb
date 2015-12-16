require 'spec_helper'

describe file('/opt/capstorm/CopyStormMedic') do
  it { should be_directory }
end

describe file('/opt/capstorm/CopyStormMedic/CopyStormMedic.sh') do
  it { should be_file }
  it { should be_executable }
end

describe file('/opt/capstorm/CopyStormMedic/lib/mysql-connector-java.jar') do
  it { should be_symlink }
end

describe file('/etc/capstorm/session.copyStormMedic') do
  it { should be_file }
  its(:content) { should include '</CopyStormMedic' }
end


describe file('/usr/local/bin/copystorm_medic') do
  it { should be_file }
  it { should be_executable }
  its(:content) { should include 'CopyStormMedic' }
end

describe cron do
  it { should have_entry '0 18 * * * /usr/local/bin/copystorm_medic' }
end
