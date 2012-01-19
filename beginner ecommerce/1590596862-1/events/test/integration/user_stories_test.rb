require "#{File.dirname(__FILE__)}/../test_helper"

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :users, :events

  def test_multiple_users_creating_an_event
    eugene = registered_user
    lauren = registered_user

    eugene.logs_in 'eugene', 'secret'
    lauren.logs_in 'lauren', 'secret'

    eugene.creates_event :title => 'Punk Rock Show', :location => 'Bar'
    lauren.creates_event :title => 'BBQ', :location => 'My back yard'
    
    eugene.logs_out
    lauren.logs_out
  end

  private
    def registered_user
      open_session do |user|
        def user.logs_in(login, password)
          get '/login'

          assert_response :success
          assert_template 'login'

          post '/login', :login => login, :password => password

          assert_response :redirect
          assert_redirected_to :controller => 'events'

          follow_redirect!

          assert_response :success
          assert_template 'index'
          assert session[:user_id]
        end

        def user.logs_out
          get '/logout'

          assert_response :redirect
          assert_redirected_to :action => 'login'
          assert_nil session[:user]

          follow_redirect!

          assert_template 'login'
        end

        def user.creates_event(event_hash)
          get '/events/new'

          assert_response :success
          assert_template 'new'

          post '/events/create', :event => event_hash

          assert assigns(:event).valid?
          assert_response :redirect
          assert_redirected_to :action => 'index'

          follow_redirect!

          assert_response :success
          assert_template 'index'
        end
      end
    end
end
