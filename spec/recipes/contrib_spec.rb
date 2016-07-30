require "spec_helper"

describe "postgresql::contrib" do
  describe "version 9.5" do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set["postgresql"]["version"] = "9.5"
      end.converge(described_recipe)
    end

    it "installs the `postgresql-contrib-9.5` package" do
      expect(chef_run).to install_package("postgresql-contrib-9.5")
    end
  end
end
