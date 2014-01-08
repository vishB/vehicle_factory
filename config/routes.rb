Factory::Application.routes.draw do
  resources :engines


  resources :fuels


  resources :vehicle_types

  resources :user_accesses


  devise_for :users
  resources :users, :controller => "users" do
    collection do
      get 'change_password'
      get 'change_admin'
      post 'change_admin'
    end
  end  


  resources :user_details


  resources :constructions

  
  resources :vehicles do
    member do
      get 'info'
      get 'engine_data'
      post 'engine_data'
    end

    collection do
      get 'engine_data'
    end
  end


  # Allow admin to allocate vehicles to users
  match 'user_accesses/:id/allocate_users' => 'user_access#allocate_users', :as => :allocate_users

  # Allow users to add more vehicles
  match 'user_accesses/:id/add_more_vehicles' => 'user_access#add_more_vehicles', :as => :more_vehicles

  match 'user_accesses/:id/remove_vehicles' => 'user_access#remove_vehicles', :as => :remove_vehicles

  # Allow users to share vehicles to users
  match 'user_accesses/:id/share_vehicles_with_users' => 'user_access#share_vehicles_with_users', :as => :share_vehicles_with_users

  # Allow users to share vehicles to users
  match 'user_accesses/:id/unshare_vehicles' => 'user_access#unshare_vehicles', :as => :unshare_vehicles
  
  # # Allow users to share vehicles to users
  # match 'user_accesses/:id/unshare_vehicle' => 'user_access#unshare_vehicle', :as => :unshare_vehicle
  
  # # Allow users to share vehicles to users
  # match 'user_accesses/:id/share_vehicle' => 'user_access#share_vehicle', :as => :share_vehicle

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
  root :to => 'site#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
