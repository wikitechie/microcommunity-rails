require 'spec_helper'

describe Wikipage do
  before(:each) do
    @wikipage = FactoryGirl.build(:wikipage)
  end
  
  it "should have title" do    
    @wikipage.title = ""
    @wikipage.should_not be_valid
  end
  it "should have body" do
    @wikipage.body = ""
    @wikipage.should_not be_valid
  end
  
  describe  "Wikipage assocations" do
    before (:each) do
      @wikipage = FactoryGirl.build(:wikipage)
    end
    
    it "should have a user attribute" do
      @wikipage.should respond_to :user
    end    
    
    it "should be associated to the right user" do
      @user = FactoryGirl.create(:user)
      @associate_wikipage = @user.wikipages.new(FactoryGirl.attributes_for(:wikipage))
      @associate_wikipage.user_id.should == @user.id 
    end
    
  end
  
end
