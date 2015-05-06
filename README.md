# opsworks-capstorm cookbook

Installs software from [CapStorm](http://www.capstorm.com/) into OpsWorks instances.

Currently supports CopyStorm using MySQL.

# Requirements

Java 1.7 or newer.

# Usage

Configure attributes and include recipe in run-list of desired layer.

# Attributes

- `node[:capstorm][:config_dir]` - Directory for configuration files.
- `node[:capstorm][:install_dir]` - Directory for installation.

- `node[:capstorm][:copystorm][:package_url]` - URL to fetch ZIP package from to install application.
- `node[:capstorm][:copystorm][:session_file][:cookbook]` - Name of cookbook to copy CopyStorm session file from.
- `node[:capstorm][:copystorm][:session_file][:name]` - Name of CopyStorm session file.

# Recipes

- `copystorm` - Install [CopyStorm](http://www.capstorm.com/copystorm).

# Author

Author:: Sport Ngin (<platform-ops@sportngin.com>)
