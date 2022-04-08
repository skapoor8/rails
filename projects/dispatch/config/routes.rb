Rails.application.routes.draw do
  resources :departments

  resources :responses

  resources :report_custom_comments

  resources :incident_report_comments

  resources :incident_question_custom_answers

  resources :incident_question_answers
  
  resources :incident_questions

  resources :incidents
  
  resources :users

  get 'sessions/new'

  get 'users/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new' #incidents#index'

  get '/api-docs', :to => redirect('/api.html')
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'incidents_questions/new/:type' => 'incidents_questions#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
#  get '/loaderio-c91b45fad800a115f2a2caae4ceed6c5' => 'loaderio-c91b45fad800a115f2a2caae4ceed6c5.txt'
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
