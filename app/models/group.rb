class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships, :class_name => "User"
end

