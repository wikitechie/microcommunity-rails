require 'spec_helper'

describe Activity do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:action_object) }
    it { should belong_to(:target_object) }
  end

  describe "attributes validation" do
    it { should validate_presence_of(:verb) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:action_object) }
  end

end

