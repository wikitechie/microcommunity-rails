class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  acts_as_commentable

  validates :text, :presence => true
  validates :user_id, :presence => true
end

