require "spec_helper"

describe "postgresql::service" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "defines the `postgresql` service" do
    expect(chef_run).to enable_service("postgresql")
    expect(chef_run).to start_service("postgresql")
  end
end
