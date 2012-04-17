require 'spec_helper'

describe MembershipsController do


  def valid_attributes
    {
      :group_id => @group.id,
      :user_id => @user.id
    }
  end

  before :each do
    @creator = FactoryGirl.create(:user)
    User.current_user = @creator
    @group = FactoryGirl.create(:group)

    @user = FactoryGirl.create(:user)
    @group.memberships.create(:user_id => @user.id)
    User.current_user = @user
  end

  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a new membership" do
        expect {
          post :create, {:membership => valid_attributes}
        }.to change(Membership, :count).by(1)
      end

      it "creates a proper membership" do
        post :create, {:membership => valid_attributes}
        @group.users.include?(@user).should be_true
      end

      it "redirects to the last position"
    end
  end

end

