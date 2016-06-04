Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'
  mount API::Core => "/api"
end
