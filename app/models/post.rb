class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  has_many :comments

  validates :text, :presence => true

end
