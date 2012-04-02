require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :text => "MyText",
      :user_id => 1,
      :owner_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "textarea#post_text", :name => "post[text]"
      assert_select "input#post_user_id", :name => "post[user_id]"
      assert_select "input#post_owner_id", :name => "post[owner_id]"
    end
  end
end
