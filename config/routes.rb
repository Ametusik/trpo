Rails.application.routes.draw do
  get 'real_estates/search', to: "real_estates#search", as: :search
  get 'real_estates/add_to_favorite/:id', to: "real_estates#add_to_favorite", as: :add_to_favorite
  get 'real_estates/remove_from_favorite/:id', to: "real_estates#remove_from_favorite", as: :remove_from_favorite
  resources :real_estates
  root "home#index"
  get '/home/index', to: "home#index", as: :home_index
  get '/my', to: "home#my", as: :my
  get '/favorites', to: "home#favorites", as: :favorites
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
