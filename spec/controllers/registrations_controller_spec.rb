require 'spec_helper'

describe RegistrationsController do

  def valid_attributes
    @creator = FactoryGirl.create(:user)
    User.current_user = @creator
    @group = FactoryGirl.create(:group)

    @user = FactoryGirl.create(:user)
    @group.memberships.create(:user_id => @user.id)
    User.current_user = @user

    {
      :group_id => @group.id,
      :user_id => @user.id
    }
  end

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end


  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a new Membership" do
        expect {
          post :create, {:user => valid_attributes, :name => "Boo"}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes, :name => "Boo"}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "creates a new Profile" do
        expect {
          post :create, {:user => valid_attributes, :name => "Boo"}
        }.to change(Profile, :count).by(1)
      end

      it "creates a profile associated with the user" do
        post :create, {:user => valid_attributes, :name => "Boo"}
        Profile.last.user.should == User.last
      end

      it "creates a profile with the right data" do
        post :create, {:user => valid_attributes, :name => "Boo"}
        Profile.last.name == "Boo"
      end

      it "redirects to the user profile" do
        post :create, {:user => valid_attributes, :name => "Boo"}
        response.should redirect_to(User.last.profile)
      end
    end
  end

end

