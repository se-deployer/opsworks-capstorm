remote_file "#{Chef::Config[:file_cache_path]}/CopyStormMedic.zip" do
  source node[:capstorm][:copystorm_medic][:package_url]
  action :create
end

execute "unzip #{Chef::Config[:file_cache_path]}/CopyStormMedic.zip -d #{node[:capstorm][:install_dir]}" do
  not_if { ::File.exists?("#{node[:capstorm][:install_dir]}/CopyStormMedic") }
end
execute "chmod +x #{node[:capstorm][:install_dir]}/CopyStormMedic/CopyStormMedic.sh"

link "#{node[:capstorm][:install_dir]}/CopyStormMedic/lib/mysql-connector-java.jar" do
  to "/usr/share/java/mysql-connector-java.jar"
end

cookbook_file node[:capstorm][:copystorm_medic][:session_file][:name] do
  cookbook node[:capstorm][:copystorm_medic][:session_file][:cookbook]
  path "#{node[:capstorm][:config_dir]}/session.copyStormMedic"
end

file "/var/log/copystorm_medic.log" do
  action :create_if_missing
end

template "/usr/local/bin/copystorm_medic" do
  source "copystorm_medic.sh.erb"
  mode "0755"
  variables(
      :capstorm => node[:capstorm]
  )
end

unless node[:capstorm][:copystorm_medic][:cron][:hour].nil?
  cron "copystorm_medic" do
    command node[:capstorm][:copystorm_medic][:cron_command]
    minute '0'
    hour node[:capstorm][:copystorm_medic][:cron][:hour]
  end
end
