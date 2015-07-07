Rails.application.routes.draw do

  namespace :profile do
    resources :basics
    resources :my_projects, only: [:index]
    resources :contacts, only: [:show]
  end

  scope module: :project, as: :project do
    resources :projects
    resources :questions, path: '/projects/:project_id/questions' do
      resource :answer, only: [:edit, :update]
    end
    resources :tags
  end

  devise_for :members,
             class_name: 'Identity::Member',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',

             },
             controllers: {
                 sessions: 'identity/members/sessions',
                 registrations: 'identity/members/registrations',
                 omniauth_callbacks: 'identity/members/omniauth_callbacks'
             } do
    get 'logout', :to => 'identity/members/sessions#destroy', :as => :destroy_member_session
  end

  root 'home/home#show'

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
