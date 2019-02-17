Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ideas
  #resources :pages

	#root "pages#home"
	root "pages#home"
	get 'pages/home', to: 'pages#home'
	get 'pages/about', to: 'pages#about'
	get 'signup', to: 'users#new'
	resources :users, except: [:new]

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	resources :categories, except: [:destroy]
	
end
