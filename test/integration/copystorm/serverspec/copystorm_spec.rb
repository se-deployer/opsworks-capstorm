require 'spec_helper'


describe package('mysql-connector-java') do
  it { should be_installed }
end

describe file('/opt/capstorm/CopyStorm') do
  it { should be_directory }
end

describe file('/opt/capstorm/CopyStorm/CopyStorm.sh') do
  it { should be_file }
  it { should be_executable }
end

describe file('/opt/capstorm/CopyStorm/lib/mysql-connector-java.jar') do
  it { should be_symlink }
end

describe file('/etc/capstorm/session.copyStorm') do
  it { should be_file }
  its(:content) { should match <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<CopyStorm targetDatabase="MySQL">
  <Salesforce createSchema="true" instanceType="Production" useApacheClient="false"/>
  <SalesforceAdvanced apacheLog="false" continueOnDMLError="false" createIndexes="true" describeBatchSize="100" describeCache="false" destBatchSize="200" destbuffers="10" forceUpdate="false" ignoreTimestamps="false" keepDeletedColumns="false" multiThread="true" nExtraScalDigits="2" purgeDays="0" queryBatchSize="2000" rebuildOnDMLError="false" reconnect="5" reconnectDelay="60" showVisualProgress="false" silent="false" strictDecimal="false" timeout="1000">
    <ExcludeTables>
      <table name=".*Feed"/>
      <table name=".*_Share"/>
      <table name="Attachment"/>
      <table name="ContentVersion"/>
      <table name="FeedComment"/>
      <table name="Event"/>
      <table name="Task"/>
    </ExcludeTables>
  </SalesforceAdvanced>
  <SalesforceProxy/>
  <Database dumpreplaceCR="false" type="Directory"/>
</CopyStorm>
EOF
  }
end


describe file('/usr/local/bin/copystorm') do
  it { should be_file }
  it { should be_executable }
end

describe cron do
  it { should have_entry '0 6 * * * /usr/local/bin/copystorm' }
end
