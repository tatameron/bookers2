Rails.application.routes.draw do
	devise_for :users
	root to: 'bookers#index'
	get 'bookers/index'
	get 'bookers/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
end

resources :users, only: [:show,:edit,:update,:index]



end