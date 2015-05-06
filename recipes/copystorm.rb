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

#TODO credentials?
#TODO cron?
