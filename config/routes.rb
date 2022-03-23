Rails.application.routes.draw do
  root 'movies#index'

  namespace :admin do
    resources :movies
  end
end
