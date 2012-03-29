class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships

  has_many :posts, :as => :owner

  def user
    members.first
  end

end

