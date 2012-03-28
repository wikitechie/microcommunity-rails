require 'spec_helper'

describe "attendances/show" do
  before(:each) do
    @attendance = assign(:attendance, stub_model(Attendance,
      :user_id => 1,
      :event_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
