Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :tricks do
  	member do
  		get "like", to: "tricks#upvote"
  		get "dislike", to: "tricks#downvote"
  	end
  	resources :comments
  end

  root 'tricks#index'
end
