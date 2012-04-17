require 'spec_helper'

describe GroupFollowsController do

  def valid_attributes
    @creator = FactoryGirl.create(:user)
    User.current_user = @creator
    @group = FactoryGirl.create(:group)

    @user = FactoryGirl.create(:user)
    @group.memberships.create(:user_id => @user.id)
    User.current_user = @user

    @wikipage = FactoryGirl.create(:wikipage)

    {
      :group_id => @group.id,
      :user_id => @user.id,
      :content_type => "Wikipage",
      :content_id => @wikipage.id
    }

  end

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/'
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

      it "redirects to the last position"

    end
  end

end

