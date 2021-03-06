Rails.application.routes.draw do
  resources :turnos
  resources :nota_reparaciones
  resources :nota_pedidos
  resources :unidades do
    resources :novedad_mecanicas
  end
  resources :proveedores
  resources :choferes
  resources :memberships
  resources :roles
  resources :direcciones
  resources :talleres
  resource :dashboard, only: :show
  resource :configuracion, only: :show
  root to: 'dashboards#show'

  devise_for :usuarios, controllers: {
        confirmations: 'usuarios/confirmations',
        registrations: 'usuarios/registrations',
        #session: 'usuarios/sessions'
      } do
  get '/login' => 'usuarios/sessions#new', as: :login
  get '/logout' => 'usuarios/sessions#destroy', as: :logout

  patch '/usuarios/sign_up' => 'usuarios/registrations#update', as: :usuario_registration
  post '/usuarios/sign_up' => 'usuarios/registrations#create', as: :usuario_registration

  end
  resources :usuarios do
    #, only: [:index, :new, :create, :destroy, :edit, :update]
    get 'resend_invitation', action: :resend_invitation, controller: 'usuarios'
    get 'active_deactive', action: :active_deactive, controller: 'usuarios'
  end

  get 'my_taller', to: 'talleres#edit'
  # patch 'my_company', to: 'companies#update', as: :update_company
  put 'my_taller', to: 'talleres#update', as: :update_taller

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
