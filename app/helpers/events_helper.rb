module EventsHelper
	def attend_path(event)
		event_path(event).concat('/attend')
	end
end
