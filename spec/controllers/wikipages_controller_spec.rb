require 'spec_helper'

describe WikipagesController do
    render_views

    describe "GET 'show'" do
      before(:each) do
        @wikipage = FactoryGirl.create(:wikipage)
      end
      it "should have the right title" do
        get :show, :id => @wikipage        
        response.should have_content @wikipage.title
      end
      it "should have the right body" do
        get :show, :id => @wikipage    
        response.should have_content @wikipage.body
      end
      it "should have the author" do
        get :show, :id => @wikipage    
        response.should have_content @wikipage.user.email
      end
      it "should have the date of creation" do
        get :show, :id => @wikipage    
        response.should have_content @wikipage.created_at
      end
      it "should have the date of updating" do
        get :show, :id => @wikipage    
        response.should have_content @wikipage.updated_at
      end      
    end
    

  
  

end
