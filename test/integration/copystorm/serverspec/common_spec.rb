require 'spec_helper'

describe file('/etc/capstorm') do
  it { should be_directory }
end
