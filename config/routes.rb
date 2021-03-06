Rails.application.routes.draw do

  resources :contacts
  #get 'news/new'
  #get 'news/show'
  #get 'news/index'
  #get 'news/edit'
  #get 'news/create'

  resources :news
  delete '/news/:id' => 'news#destroy', as: 'destroy_news'

  root 'main_pages#home'

  get 'main_pages/home'

  get 'main_pages/about'

  devise_for :users

  post 'contacts/:id/delete_avatar' => 'contacts#delete_avatar', as: 'delete_avatar'
  
  post 'news/:id/up' => 'news#up', as: 'news_up'
  post 'news/:id/down' => 'news#down', as: 'news_down'

  post 'contacts/:id/up' => 'contacts#up', as: 'contact_up'
  post 'contacts/:id/down' => 'contacts#down', as: 'contact_down'

  #delete 'contacts/:id/delete_avatar' => 'contacts#delete_avatar'


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
