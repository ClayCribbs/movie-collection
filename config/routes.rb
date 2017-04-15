Rails.application.routes.draw do
  resources :cast_members, only: [ :show ]

  resources :collections
	resources :movies do
    put :manage_collection, on: :member
  end
  devise_for :users
  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
