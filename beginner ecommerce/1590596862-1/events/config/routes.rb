ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  map.connect '', :controller => 'events'

  map.login  'login',  :controller => 'users', :action => 'login'
  map.logout 'logout', :controller => 'users', :action => 'logout'
  map.signup 'signup', :controller => 'users', :action => 'new'

  map.events     'events',          :controller => 'events'
  map.new_event  'events/new',      :controller => 'events', :action => 'new'
  map.edit_event 'events/edit/:id', :controller => 'events', :action => 'edit'
  map.event      'events/show/:id', :controller => 'events', :action => 'show'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
