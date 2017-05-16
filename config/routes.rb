Rails.application.routes.draw do
  
  resources :stores
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

	resources :stores do 
		member do 
			get :follow
      get :unfollow
		end
	end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
