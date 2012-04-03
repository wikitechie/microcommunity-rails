class Wikipage < ActiveRecord::Base
  belongs_to :user
  has_many :revisions

  acts_as_followable
  
  validates :title, :presence => true
  validates :body, :presence => true
  
  has_many :activities, :as => :action_object
  
end
