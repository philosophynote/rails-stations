Rails.application.routes.draw do
  root 'movies#index'

  resources :movies, only: [:index ,:show] do
  end

  namespace :admin do
    resources :movies
  end
end
