#
# Cookbook Name:: postgresql
# Recipe:: service
#

file "/usr/sbin/policy-rc.d" do
  action :delete
end

# define the service
service "postgresql" do
  supports reload: true, restart: true, status: true
  action Array(node["postgresql"]["service_actions"]).map(&:to_sym)
end

# Debian 8 and above:
#
# PGDG's systemd-enabled packages require a service per version/cluster
# see:
# http://bazaar.launchpad.net/~ubuntu-branches/debian/jessie/postgresql-common/jessie/view/head:/systemd/README.systemd
#
if node["platform"] == "debian" && node["platform_version"].to_f >= 8.0
  # cluster_name typically defaults to 'main'
  main_cluster_name = File.basename node["postgresql"]["data_directory"]

  # service name will be e.g. 'postgresql@9.4-main'
  service "postgresql@#{node["postgresql"]["version"]}-#{main_cluster_name}" do
    supports reload: true, restart: true, status: true
    action Array(node["postgresql"]["service_actions"]).map(&:to_sym)
  end
end
