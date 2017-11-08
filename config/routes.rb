Rails.application.routes.draw do
  get 'main/index'

	resources :workouts do
		resources :movements
	end

	root 'main#index'
end
