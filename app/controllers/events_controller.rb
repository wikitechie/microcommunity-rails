class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

	def attend
		@event = Event.find(params[:id])
		@event.attendances.create({:user_id => current_user.id, :event_id => @event.id})

	end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
      	@event.attend(current_user)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
