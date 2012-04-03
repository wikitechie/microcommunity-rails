require 'spec_helper'

describe "revisions/show" do
  before(:each) do
    @revision = assign(:revision, stub_model(Revision))
  end

  it "renders attributes in <p>" do
    render
  end
end
