class Membership < ActiveRecord::Base
  has_one :member, :class_name => :user
  has_one :group
end

