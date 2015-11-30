# opsworks-capstorm cookbook

Installs software from [CapStorm](http://www.capstorm.com/) into OpsWorks instances.
Execution is scheduled daily via Cron and wrapped in a script that can alert Pager Duty on error.
Currently supports CopyStorm using MySQL.

# Requirements

Amazon Linux with Java 1.7 or newer.

# Usage

Configure attributes and include recipe in run-list of desired layer.

# Attributes

- `node[:capstorm][:config_dir]` - Directory for configuration files.
- `node[:capstorm][:install_dir]` - Directory for installation.
- `node[:capstorm][:pager_duty_service_key]` - Pager Duty service key to alert on error. Set to nil to omit alerting.

- `node[:capstorm][:copystorm][:package_url]` - URL to fetch ZIP package from to install application.
- `node[:capstorm][:copystorm][:session_file][:cookbook]` - Name of cookbook to copy CopyStorm session file from.
- `node[:capstorm][:copystorm][:session_file][:name]` - File name of CopyStorm session file in sourced cookbook.
- `node[:capstorm][:copystorm][:license_file][:cookbook]` - Name of cookbook to copy CopyStorm session file from.
- `node[:capstorm][:copystorm][:license_file][:name]` - File name of CopyStorm license file in sourced cookbook.
- `node[:capstorm][:copystorm][:cli_args]` - Optional arguments to pass to CopyStorm CLI.
- `node[:capstorm][:copystorm][:cron][:hour]` - Hour to execute CopyStorm via Cron. Set to nil to omit cron.

- `node[:capstorm][:copystorm_medic][:enable]` - Enable CopyStorm Medic to run following CopyStorm.  Defaults to false.
- `node[:capstorm][:copystorm_medic][:package_url]` - URL to fetch ZIP package from to install application.
- `node[:capstorm][:copystorm_medic][:session_file][:cookbook]` - Name of cookbook to copy CopyStorm Medic session file from.
- `node[:capstorm][:copystorm_medic][:session_file][:file]` - File name of CopyStorm Medic session in sourced cookbook.
- `node[:capstorm][:copystorm_medic][:tools]` - Array of tool names to execute.  Defaults to `fixDeleted`.
- `node[:capstorm][:copystorm_medic][:cli_args]` - Optional arguments to pass to CopyStorm CLI.

# Recipes

- `copystorm` - Install [CopyStorm](http://www.capstorm.com/copystorm).

# Author

Author:: Sport Ngin (<platform-ops@sportngin.com>)
