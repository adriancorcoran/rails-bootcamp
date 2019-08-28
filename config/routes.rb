Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboards/hello', to: 'dashboards#hello'
  get 'dashboards/hi', to: 'dashboards#hi'
  get 'dashboards/personalized/:name', to: 'dashboards#personalized', as: :dashboards_personalized
  get 'dashboards/personalised/:name', to: 'dashboards#personalized', as: :dashboards_personalised
  get 'dashboards/reversed/:name', to: 'dashboards#reversed', as: :dashboards_reversed

  resources :users
  # creates the following paths
  
  # users_path returns /users
  # new_user_path returns /users/new
  # edit_user_path(:id) returns /users/:id/edit (for instance, edit_user_path(10) returns /users/10/edit)
  # user_path(:id) returns /users/:id (for instance, user_path(10) returns /users/10)

end
