require 'spec_helper'

describe Roundup::Resource::Base do

  class ExampleResource < Roundup::Resource::Base
    attributes :name, :status, :notes
  end

  before(:each) do
    @mock_api = mock('RallyAPI')
    Roundup.stub!(:rally).and_return(@mock_api)
  end
  
  describe "attribute handling" do
    it "should support initialization with attributes" do
      x = ExampleResource.new(:name => 'bob', :status => 'pending')
      x.should respond_to(:name)
      x.name.should eql('bob')
    end
  end

  describe "finding existing resources" do
    it "should inflect the class name for rally" do
      @mock_api.should_receive(:find).with(:example_resource) 
      ExampleResource.find { equals :name, 'bob' }
    end

    it "should accept block finders" do
      self.stub!(:equals)
      @finder = mock('Finder')
      @mock_api.stub!(:find).and_yield @finder 
      ExampleResource.find { equals :name, 'bob'}  
    end
  end

end
