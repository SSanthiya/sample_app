SampleApp::Application.routes.draw do
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
  get "sessions/new"

  # specify :users to be a resource in the RESTFul style.
  
  resources :users
  resources :sessions, :only => [:new,:create,:destroy]
  resources :microposts, :only=> [:create,:destroy]
  resources :relationships, :only => [:create,:destroy]
  
  

  # also creates a "named route" for use in the controllers and views
  #contact_path  (relative)
  #contact_url   (absolute url)
  match '/contact', :to => 'pages#contact'
  
  # also creates a "named route" for use in the controllers and views
  match '/about',   :to => 'pages#about'
  
  # also creates a "named route" for use in the controllers and views
  match '/help',    :to => 'pages#help'
  
  # also creates a "named route" for use in the controllers and views
  match '/contact', :to => 'pages#contact'
  
  # also creates a "named route" for use in the controllers and views
  match '/signup', :to => 'users#new'
  
  # also create a "named route for signin and signout
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
