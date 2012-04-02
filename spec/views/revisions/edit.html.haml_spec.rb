require 'spec_helper'

describe "revisions/edit" do
  before(:each) do
    @revision = assign(:revision, stub_model(Revision))
  end

  it "renders the edit revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => revisions_path(@revision), :method => "post" do
    end
  end
end
