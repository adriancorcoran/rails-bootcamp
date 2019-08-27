Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboards/hello', to: 'dashboards#hello'
  get 'dashboards/hi', to: 'dashboards#hi'
  get 'dashboards/personalized/:name', to: 'dashboards#personalized', as: :dashboards_personalized
  get 'dashboards/personalised/:name', to: 'dashboards#personalized', as: :dashboards_personalised
  get 'dashboards/reversed/:name', to: 'dashboards#reversed', as: :dashboards_reversed
end
