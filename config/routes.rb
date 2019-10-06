Rails.application.routes.draw do
  get 'comments/create'
  	root 'posts#index'
  	
	resources :posts do
		resources :comments
	end
end
