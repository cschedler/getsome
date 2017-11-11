Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/logout', to: 'sessions#destroy'

  get 'main/index'

	resources :users
	resources :workouts do
		resources :movements
	end

	root 'main#index'
end
