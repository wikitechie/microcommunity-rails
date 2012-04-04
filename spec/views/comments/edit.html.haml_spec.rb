require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "MyString",
      :user_id => 1,
      :post_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_body", :name => "comment[body]"
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_post_id", :name => "comment[post_id]"
    end
  end
end
