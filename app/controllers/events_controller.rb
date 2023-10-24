class EventsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_event, only: [:update, :destroy]


def index
  @events = Event.all
end


def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  if @event.save
    redirect_to events_path, notice: 'Event was successfully created.'
  else
    render 'new'
  end
end

def update
  if @event.update(event_params)
    render :index
  end
end


def destroy
  if @event.destroy
    render :index
  end
end


  # Define the event_params method to whitelist the parameters you want to permit.
  private

  def set_event
    @event = Event.find_by(id: params[:id])
  end
  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :description)
  end
end
