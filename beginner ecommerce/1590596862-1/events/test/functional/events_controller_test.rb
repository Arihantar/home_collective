require File.dirname(__FILE__) + '/../test_helper'
require 'events_controller'

# Re-raise errors caught by the controller.
class EventsController; def rescue_action(e) raise e end; end

class EventsControllerTest < Test::Unit::TestCase
  fixtures :events, :users

  def setup
    @controller = EventsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = events(:tiki_party).id
  end

  def test_index
    get :index

    assert_response :success
    assert_template 'index'

    assert_not_nil assigns(:events)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:event)
    assert assigns(:event).valid?
  end

  def test_new
    login_as :eugene

    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:event)
  end

  def test_create
    login_as :eugene
    
    num_events = Event.count

    post :create, :event => { :title    => 'Test title',
                              :url      => 'http://example.com',
                              :location => 'Test location' }

    assert_response :redirect
    assert_redirected_to :action => 'index'
    
    assert_equal num_events + 1, Event.count
  end

  def test_edit
    login_as :eugene

    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:event)
    assert assigns(:event).valid?
  end

  def test_update
    login_as :eugene

    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    login_as :eugene

    assert_nothing_raised { Event.find(@first_id) }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'index'

    assert_raise(ActiveRecord::RecordNotFound) { Event.find(@first_id) }
  end
end


