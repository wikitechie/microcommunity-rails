require 'spec_helper'

describe Membership do
  before(:each) do
    @membership = FactoryGirl.build(:membership)
  end

  it "should require a user" do
    @membership.user_id = nil
    @membership.should_not be_valid
  end

  it "should require a group" do
    @membership.group_id = nil
    @membership.should_not be_valid
  end
end

