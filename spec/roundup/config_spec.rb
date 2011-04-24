require 'spec_helper'

describe Roundup::Config do
  before do
    @config_values = {
      :base_url  => 'example.com',
      :workspace => 'workspace',
      :project   => 'project',
      :username  => 'username',
      :password  => 'password' }
    @config = Roundup::Config.new(@config_values)
    Roundup.config = @config
  end

  describe "hash conversion" do
    it "should provide a proper hash from an existing config" do
      @config.to_hash.should eql(@config_values)
    end
  end

  describe "attributes" do
    it "should have the required attributes accessors" do
      [:base_url, :workspace, :username, :password, :project, :logger, :version, :builder].each do |attr|
        @config.should respond_to(attr)
        @config.send(attr).should eql(@config_values[attr])
      end
    end

    it "should provide list of attributes names" do
      @config.attributes.should eql([:base_url, :workspace, :username, :password, :project, :logger, :version, :builder])
    end
  end
end
