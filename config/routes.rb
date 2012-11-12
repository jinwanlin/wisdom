Wisdom::Application.routes.draw do
  
  get "home/index"

  resources :forums  do
    resources :articles
  end
  
  resources :authors do
    resources :articles
  end
  
  resources :articles do
    resources :steps
    resources :materials
  end
  
  resources :steps

  resources :materials


  get "/zcfg" => "repositories#zcfg"
  
  resources :repositories

  resources :doctors

  resources :community_health_stations

  resources :hospitals

  resources :houses

  resources :coupons

  get "/get_token" => 'weibo_tokens#show'

  resources :weibo_tokens

  resources :hotline do 
    collection do
      get 'more'
    end
  end
  

  get "hotline/more"
  
  resources :merchants do
    collection do
      get 'near'
    end
  end

  resources :seconds

  resources :accounts, :controller => "users"
  
  post '/login' => 'users#login'
  
  resources :notes
  get '/photos' => 'notes#photos'

  resources :communities

  devise_for :users

  resources :news

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
