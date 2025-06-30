class EventsController < ApplicationController
  def index
    @events = Event.all
  end

   def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(even_params)
    if @event.save
      redirect_to @event, notice: 'Event successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      NotificationJob.perform_async(@event.id)
      redirect_to @event, notice: 'Event updated'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event deleted'
  end

  private 

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :venue)
  end

  def require_organizer
    unless current_user.organizer?
      redirect_to events_path, alert: 'Access denied'
    end
  end
end
