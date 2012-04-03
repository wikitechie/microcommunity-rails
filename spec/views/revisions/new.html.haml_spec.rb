require 'spec_helper'

describe "revisions/new" do
  before(:each) do
    assign(:revision, stub_model(Revision).as_new_record)
  end

  it "renders new revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => revisions_path, :method => "post" do
    end
  end
end
