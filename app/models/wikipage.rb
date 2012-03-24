class Wikipage < ActiveRecord::Base
  belongs_to :user
  
  acts_as_followable
  
  validates :title, :presence => true
  validates :body, :presence => true
end
