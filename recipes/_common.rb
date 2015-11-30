java_ver = node[:languages][:java][:version]
if java_ver =~ /^1\.[1-6].*$/
  Chef::Log.fatal("Unsupported Java version: #{java_ver}")
  raise
end

directory node[:capstorm][:config_dir] do
  action :create
  recursive true
end

directory node[:capstorm][:install_dir] do
  action :create
  recursive true
end
