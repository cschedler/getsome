Rails.application.routes.draw do
  get 'users/new'

  get 'main/index'

	resources :users
	resources :workouts do
		resources :movements
	end

	root 'main#index'
end
