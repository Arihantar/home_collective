class EventsController < ApplicationController
  before_filter :authenticate, :except => %w(index search show email_friend)
  simply_searchable :fields => %w(title location), :template => 'events/index'
  auto_complete_for :event, :location

  def index
    @event_pages, @events = paginate :events, :per_page => 10
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = session[:event_draft] || current_user.events.build
  end

  def create
    @event = current_user.events.build(params[:event])
    @event.categories << Category.find(params[:categories]) unless params[:categories].blank?
    @event.tag_with(params[:tags]) if params[:tags]
    
    if @event.save
      flash[:notice] = 'Event was successfully created.'
      session[:event_draft] = nil
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.attributes = params[:event]
    @event.category_ids = params[:categories]
    @event.tag_with(params[:tags]) if params[:tags]
    
    if @event.save
      flash[:notice] = 'Event was successfully updated.'
      redirect_to :action => 'show', :id => @event
    else
      render :action => 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def email_friend
    event = Event.find(params[:id])
    EventMailer.deliver_email_friend(params[:email], params[:name], event)
    flash[:notice] = 'Your friend has been notified about this event'
    redirect_to event_url(event)
  end
  
  def observe_new
    session[:event_draft] = current_user.events.build(params[:event])
    render :nothing => true
  end
  
  def update_location
    Event.update(params[:id], {:location => params[:value]})
    render :text => params[:value]
  end
end
