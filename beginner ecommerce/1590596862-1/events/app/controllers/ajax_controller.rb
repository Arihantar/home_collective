class AjaxController < ApplicationController
  def simple_response
    render :text => "<p>Rails loves Ajax :D</p>"
  end
  
  def current_date
    render :text => "<p>#{Time.now}</p>"
  end
  
  def events
    count_events
  end
  
  def save_event
    Event.create(params[:event])
    count_events
    
    render :update do |page|
      # Replace the count element
      page.replace_html 'count', :partial => 'events_count'
      page.visual_effect :highlight, 'count'
      
      # Clean up the UI
      page['event_title'].value = ''
      page['event_location'].value = ''
      page['event_title'].focus
      
      # Hide the indicator image
      page['indicator_form'].hide
    end
  end
  
  private
    def count_events
      @event_count = Event.count
    end
end