class Event < ActiveRecord::Base
	belongs_to :user

	has_many :attendances

	has_many :attendants, :class_name => "User", :through => :attendances, :source => :user

	def	attend(user)
		self.attendances.create({:user_id => user.id, :event_id => self.id})
	end
end
