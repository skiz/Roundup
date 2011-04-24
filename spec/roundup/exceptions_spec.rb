require 'spec_helper'

describe Roundup do
  it "should define custom Error" do
    Roundup::Error.new.should be_a_kind_of(StandardError)
  end

  it "should define ConnectionError" do
    Roundup::ConnectionError.new.should be_a_kind_of(Roundup::Error)
  end

  it "should define InvalidWorkspaceError" do
    Roundup::InvalidWorkspaceError.new.should be_a_kind_of(Roundup::Error)
  end

  it "should define InvalidProjectError" do
    Roundup::InvalidProjectError.new.should be_a_kind_of(Roundup::Error)
  end

end
