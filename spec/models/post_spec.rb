require 'spec_helper'

describe Post do
  before(:each) do
    @post = FactoryGirl.build(:post)
  end
  it "should have text" do
    @post.text = nil
    @post.should_not be_valid
  end
  it "should belong to a user" do
    @post.should respond_to :user
  end
  it "should have an owner" do
    @post.should respond_to :owner
  end
end

