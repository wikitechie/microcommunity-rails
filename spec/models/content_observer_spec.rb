require 'spec_helper'

describe ContentObserver do
  describe "Wikipage observation" do
    it "should create an proper activity on creation" do
      @user = FactoryGirl.create(:user)
      @wikipage = @user.wikipages.create(FactoryGirl.attributes_for(:wikipage))
      
      @last_activity = Activity.last
      
      @last_activity.user.should == @user
      @last_activity.action_object.should == @wikipage
      @last_activity.verb.should == "create"      
    end  
  end
  
end
