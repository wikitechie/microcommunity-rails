require 'spec_helper'

describe "revisions/index" do
  before(:each) do
    assign(:revisions, [
      stub_model(Revision),
      stub_model(Revision)
    ])
  end

  it "renders a list of revisions" do
    render
  end
end
