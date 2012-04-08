require 'spec_helper'

describe Profile do
  before(:each) do
    @attr = FactoryGirl.attributes_for(:profile)
    @profile = FactoryGirl.build(:profile)
  end

  it { should belong_to(:user) }

  it "should require a name field" do
    @profile.name = ""
    @profile.should_not be_valid
  end

  it "should belong to the right user" do
    @user_attr = FactoryGirl.attributes_for(:user)
    @user = User.create(@user_attr)

    @profile.user_id = @user.id
    @profile.save

    @user.profile.should == @profile
  end

end

