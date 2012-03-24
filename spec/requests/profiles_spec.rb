require 'spec_helper'

describe "Profiles" do
  describe "GET /profiles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get profiles_path
      response.status.should be(200)
    end
  end
end
