# opsworks-capstorm cookbook

Installs software from [CapStorm](http://www.capstorm.com/) into OpsWorks instances.

# Requirements

Java 1.7 or newer.

# Usage

Configure attributes and include recipe in run-list of desired layer.

# Attributes

- `node[:capstorm][:copystorm][:package_url]` - URL to fetch ZIP package from to install application.

# Recipes

- `copystorm` - Install [CopyStorm](http://www.capstorm.com/copystorm).

# Author

Author:: Sport Ngin (<platform-ops@sportngin.com>)
