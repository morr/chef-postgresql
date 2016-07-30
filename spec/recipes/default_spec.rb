require "spec_helper"

describe "postgresql::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "sets up an apt repository for `apt.postgresql.org`" do
    expect(chef_run).to add_apt_repository("apt.postgresql.org")
  end

  it "installs the `pgdg-keyring` package" do
    expect(chef_run).to install_package("pgdg-keyring")
  end

  it "installs the `postgresql-common` package" do
    expect(chef_run).to install_package("postgresql-common")
  end
end
