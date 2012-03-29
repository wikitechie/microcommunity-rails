class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships, :source => :member

  has_many :posts, :as => :owner

end

