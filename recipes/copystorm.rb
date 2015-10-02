include_recipe "opsworks-capstorm::_common"
package "mysql-connector-java"

directory node[:capstorm][:install_dir] do
  action :create
  recursive true
end

remote_file "#{Chef::Config[:file_cache_path]}/CopyStorm.zip" do
  source node[:capstorm][:copystorm][:package_url]
  action :create
end

execute "unzip #{Chef::Config[:file_cache_path]}/CopyStorm.zip -d #{node[:capstorm][:install_dir]}" do
  not_if { ::File.exists?("#{node[:capstorm][:install_dir]}/CopyStorm") }
end
execute "chmod +x #{node[:capstorm][:install_dir]}/CopyStorm/CopyStorm.sh"

link "#{node[:capstorm][:install_dir]}/CopyStorm/lib/mysql-connector-java.jar" do
  to "/usr/share/java/mysql-connector-java.jar"
end

cookbook_file node[:capstorm][:copystorm][:session_file][:name] do
  cookbook node[:capstorm][:copystorm][:session_file][:cookbook]
  path "#{node[:capstorm][:config_dir]}/session.copyStorm"
end

unless node[:capstorm][:copystorm][:license_file][:name].nil?
  cookbook_file node[:capstorm][:copystorm][:license_file][:name] do
    cookbook node[:capstorm][:copystorm][:license_file][:cookbook]
    path "#{node[:capstorm][:install_dir]}/CopyStorm/license.txt"
  end
end

file "/var/log/copystorm.log" do
  action :create_if_missing
end

template "/usr/local/bin/copystorm" do
  source "copystorm.sh.erb"
  mode "0755"
  variables(
      :capstorm => node[:capstorm]
  )
end

unless node[:capstorm][:copystorm][:cron][:hour].nil?
  cron "copystorm" do
    command node[:capstorm][:cron_command]
    minute '0'
    hour node[:capstorm][:copystorm][:cron][:hour]
  end
end
