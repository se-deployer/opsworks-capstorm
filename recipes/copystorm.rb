directory node[:capstorm][:install_dir] do
  action :create
  recursive true
end

remote_file "#{Chef::Config[:file_cache_path]}/CopyStorm.zip" do
  source node[:capstorm][:copystorm][:package_url]
  action :create
end

execute "unzip #{Chef::Config[:file_cache_path]}/CopyStorm.zip -d #{node[:capstorm][:install_dir]}"
execute "chmod +x #{node[:capstorm][:install_dir]}/CopyStorm/CopyStorm.sh"

package "mysql-connector-java"

#TODO session file?
#TODO credentials?
#TODO cron?
