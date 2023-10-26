Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pokemon#index"
  resources :pokemon do
    collection do
      get 'search'
    end
  end

  resources :move

  get "/about", to: 'about#index'
end
