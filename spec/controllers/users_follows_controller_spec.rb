require 'spec_helper'

describe UsersFollowsController do

  def valid_attributes

    @follower = FactoryGirl.create(:user)
    User.current_user = @follower
    @followed = FactoryGirl.create(:user)

    {
      :follower_user_id => @follower.id,
      :followed_user_id => @followed.id
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
        @follower.following?(@followed).should be_true
      end

      it "redirects to the last position"

    end
  end
end

