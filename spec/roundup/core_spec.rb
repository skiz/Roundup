require 'spec_helper'
require 'ostruct'

describe Roundup do

  before(:each) do
    @config_values = {
      :base_url  => 'example.com',
      :workspace => 'workspace',
      :project   => 'project',
      :username  => 'username',
      :password  => 'password' }
    @config = OpenStruct.new(@config_values)
    @mock_api = mock(RallyRestAPI, :find => [])
    RallyRestAPI.stub!(:new).and_return(@mock_api)
    Roundup.stub!(:configure_workspace)
    Roundup.stub!(:configure_project)
  end

  describe "when setting up the interface" do
    it "should create a new config instance" do
      Roundup::Config.should_receive(:new).and_return(@config)
      Roundup.setup(@config)
    end

    it "should handle block arguments" do
      Roundup.setup do |cfg|
        cfg.base_url  = @config.base_url
        cfg.workspace = @config.workspace
        cfg.project   = @config.project
        cfg.username  = @config.username
        cfg.password  = @config.password
      end
      Roundup.config.to_hash.should include(@config_values)
    end

    it "should crate a new rally api instance" do
      Roundup.rally.should be_an_instance_of(@mock_api.class)
    end

    it "should configure the workspace from config" do
      Roundup::Config.stub!(:new).and_return(@config)
      Roundup.should_receive(:configure_workspace).with(@config.workspace)
      Roundup.setup(@config)
    end

    it "should configure the project from config" do
      Roundup::Config.stub!(:new).and_return(@config)
      Roundup.should_receive(:configure_project).with(@config.project)
      Roundup.setup(@config)
    end

    it "should reraise SystemCallError as custom ConnectionError" do
      Roundup::Config.stub!(:new).and_return(@config)
      RallyRestAPI.should_receive(:new).and_raise(SystemCallError.new('FAIL'))
      lambda{ Roundup.setup(@config) }.should raise_error(Roundup::ConnectionError)
    end
  end

  describe "when processing a command" do
    before do
      Roundup::Config.stub!(:new).and_return(@config)
      @commands = [{:method => 'puts', :klass => 'Kernel' }]
    end

    it "should confirm availability of a command" do
      Roundup::Plugin.shoudl_receive(:registered_commands).and_return[:foobar]
    end

    it "should evaluate a registered class method" do
    end

  end
end

