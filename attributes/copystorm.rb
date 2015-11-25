default[:capstorm][:copystorm][:package_url] = nil

default[:capstorm][:copystorm][:session_file][:cookbook] = nil
default[:capstorm][:copystorm][:session_file][:file] = nil

default[:capstorm][:copystorm][:license_file][:cookbook] = nil
default[:capstorm][:copystorm][:license_file][:file] = nil

default[:capstorm][:copystorm][:cli_args] = nil

default[:capstorm][:copystorm][:cron_command] = "/usr/local/bin/copystorm"
default[:capstorm][:copystorm][:cron][:hour] = '6'


default[:capstorm][:copystorm_medic][:enable] = false
default[:capstorm][:copystorm_medic][:package_url] = nil
default[:capstorm][:copystorm_medic][:session_file][:cookbook] = nil
default[:capstorm][:copystorm_medic][:session_file][:file] = nil
default[:capstorm][:copystorm_medic][:tools] = %w[fixDeleted]
default[:capstorm][:copystorm_medic][:cli_args] = nil

