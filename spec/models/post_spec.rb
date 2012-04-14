require 'spec_helper'

describe Post do
  before(:each) do
    @post = FactoryGirl.build(:post)
    @attr = FactoryGirl.attributes_for(:post)
  end

  it "should require a text" do
    @post.text = nil
    @post.should_not be_valid
  end

  it "should belong to a user" do
    @user = FactoryGirl.create(:user)
    @user.posts.create(@attr).user.should_not be_nil
  end

  it "should require a user" do
    @post.user_id = nil
    @post.should_not be_valid
  end

  it "should belong to the right user" do
    @user = FactoryGirl.create(:user)

    @post.user_id = @user.id
    @post.save

    @user.posts.include?(@post).should == true
  end
  it "should have an owner" do
    @post.should respond_to :owner
  end
end

