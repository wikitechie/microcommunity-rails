class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  validates :text, :presence => true

end

