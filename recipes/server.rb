#
# Cookbook Name:: postgresql
# Recipe:: server
#

include_recipe "postgresql::default"

# Install the server and contrib packages
package "postgresql-#{node["postgresql"]["version"]}"
package "postgresql-contrib-#{node["postgresql"]["version"]}"

# setup the data directory
include_recipe "postgresql::data_directory"

# add the configuration
include_recipe "postgresql::configuration"

# declare the system service
include_recipe "postgresql::service"

# setup users
include_recipe "postgresql::setup_users"

# setup databases
include_recipe "postgresql::setup_databases"

# setup extensions
include_recipe "postgresql::setup_extensions"
