class Event < ActiveRecord::Base
	belongs_to :user

	has_many :attendances
	has_many :attendants, :class_name => "User", :through => :attendances
end
