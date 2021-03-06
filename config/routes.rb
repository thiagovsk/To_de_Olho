Rails.application.routes.draw do
  devise_for :usuarios, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :convenios do
    collection {post :import}
  end

  resources :usuarios
  resources :convenios
  resources :abaixo_assinados, :only => [:index,:show, :new, :create, :assinar]
  resources :reclamacao

  get '/abaixo_assinados/showusuario/:id', :to => 'abaixo_assinados#showusuario',as: :usuario_abaixo_assinado
  get '/home' => 'home#index', as: :home_index

  get '/home/show' => 'home#show', as: :home
  post '/abaixo_assinados' => 'abaixo_assinados#assinar', as: :assinar
  get '/abaixo_assinado/info' => 'abaixo_assinados#info', as: :info
  get '/convenios/associate/:id' => 'convenios#associate', as: :associate
  get '/usuarios/:id' => 'usuarios#show', as: :teste
  #get '/assinaturas_length', to: 'abaixo_assinados#assinaturas_length', as: 'assinaturas_length'



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
