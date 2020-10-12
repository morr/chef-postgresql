#
# Cookbook Name:: postgresql
# Recipe:: default
#

split = node["postgresql"]["initdb_options"].split("=")
if split[1]
  locale "set system locale" do
    lang split[1]
  end
end

apt_repository node["postgresql"]["apt_repository"] do
  uri          node["postgresql"]["apt_uri"]
  distribution "#{node["postgresql"]["apt_distribution"]}-pgdg"
  components   node["postgresql"]["apt_components"]
  key          node["postgresql"]["apt_key"]
  keyserver    node["postgresql"]["apt_keyserver"]
end

package "pgdg-keyring"       # Automatically get repository key updates
package "postgresql-common"  # Install common files
