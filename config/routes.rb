Rails.application.routes.draw do
  get 'admin/list'
  get 'admin/add'
  post 'admin/map_images'
  get 'static/index'

  get 'static/about'
  get 'maker/make'
  get 'static/examples'
  root 'static#index'
  devise_for :users
  get 'power_supplies/new_by_spread'
  post 'power_supplies/create_by_spread'
  get 'memories/new_by_spread'
  post 'memories/create_by_spread'
  get 'drives/new_by_spread'
  post 'drives/create_by_spread'
  get 'graphics/new_by_spread'
  post 'graphics/create_by_spread'
  get 'motherboards/new_by_spread'
  post 'motherboards/create_by_spread'
  get 'motherboards/multiple_new_by_spread'
  post 'motherboards/multiple_create_by_spread'
  get 'processors/new_by_spread'
  post 'processors/create_by_spread'
  resources :prebuilts
  resources :computer_cases
  get 'admin/list'
  match 'admin', to: 'admin#list', via: [:get]
  resources :cases
  resources :drives
  resources :power_supplies
  resources :memories
  resources :graphics
  resources :motherboards
  resources :processors
  resources :platforms
  get 'maker/build'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
