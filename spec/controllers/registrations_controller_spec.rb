require 'spec_helper'

describe RegistrationsController do

  def valid_attributes
    FactoryGirl.attributes_for(:user).merge(:name => "Blah")
  end

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end


  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "creates a new Profile" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(Profile, :count).by(1)
      end

      it "creates a profile associated with the user" do
        post :create, {:user => valid_attributes}
        User.last.profile.should_not be_nil
      end

      it "redirects to the user profile" do
        post :create, {:user => valid_attributes}
        response.should redirect_to(User.last.profile)
      end
    end
  end

end

