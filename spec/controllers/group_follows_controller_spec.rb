require 'spec_helper'

describe GroupFollowsController do

  def valid_attributes
    @group = FactoryGirl.create(:group)
    @user = FactoryGirl.create(:user)
    @group.memberships.create(:user_id => @user.id)
    @wikipage = FactoryGirl.create(:wikipage)

    {
      :group_id => @group.id,
      :user_id => @user.id,
      :content_type => "Wikipage",
      :content_id => @wikipage.id
    }

  end

  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a follows record" do
        expect {
          post :create, valid_attributes
        }.to change(Follow, :count).by(1)
      end

      it "creates a proper following relationship" do
        post :create, valid_attributes
        @group.following?(@wikipage).should be_true
      end

      it "redirects to the last position" do
        post :create, valid_attributes
        response.should redirect_to :back
      end

    end
  end

end

