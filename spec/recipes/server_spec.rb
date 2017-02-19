require "spec_helper"

describe "postgresql::server" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  before do
    stub_command("pgrep postgres").and_return(false)
    stub_command("test -f /var/lib/postgresql/9.6/main/PG_VERSION")
      .and_return(false)
  end

  specify do
    expect(chef_run).to install_package("postgresql-9.6")
    expect(chef_run).to install_package("postgresql-contrib-9.6")

    expect(chef_run).to include_recipe("postgresql::default")
    expect(chef_run).to include_recipe("postgresql::data_directory")
    expect(chef_run).to include_recipe("postgresql::configuration")
    expect(chef_run).to include_recipe("postgresql::service")

    expect(chef_run).to include_recipe("postgresql::setup_users")
    expect(chef_run).to include_recipe("postgresql::setup_databases")
    expect(chef_run).to include_recipe("postgresql::setup_extensions")
  end
end
