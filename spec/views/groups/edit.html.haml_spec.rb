require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path(@group), :method => "post" do
      assert_select "input#group_name", :name => "group[name]"
      assert_select "textarea#group_description", :name => "group[description]"
    end
  end
end
