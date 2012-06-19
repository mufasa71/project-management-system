ProjectManagementSystem::Application.routes.draw do
  resources :messages do
    member do
      delete 'trash'
      post 'untrash'
    end
    collection do
      delete 'trash'
    end
  end
  get 'search' => 'messages#search'
  resources :user_steps
  match "projects/:project_id/gantt" => "gantts#show", :as => :project_gantt
  match "projects/:project_id/phases/:phase_id/gantt" => "gantts#show", :as => :project_phase_gantt
  match 'projects/:project_id/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, :as => :calendar
  resources :projects do
    resources :phases do
      resources :activities
    end
    resources :documents
    resources :gantts, :only => [:show]
    resources :project_steps
    resources :attachments
    resources :members
    resources :milestones
    member do
      get :settings
      get :workload
      get "settings/members" => 'settings#members'
      get "settings/information" => 'settings#information'
      get "settings/milestones" => 'settings#milestones'
    end
  end

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users do
    member do
      get :details
      get :send_message
      post :send_message
    end
  end

  namespace :admin do
    resources :users, :intakes, :subjects
    get "home/index"
  end

  resources :intakes
  resources :subjects

  root :to => 'project_management#main'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
