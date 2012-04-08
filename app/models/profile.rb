class Profile < ActiveRecord::Base
  attr_accessor :name
  belongs_to :user

  validates :name, :presence => true
end

