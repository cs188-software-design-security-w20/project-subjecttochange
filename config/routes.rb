Rails.application.routes.draw do

  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/dashboard'

  get '/about', to: 'static_pages#about'
  get '/dashboard', to: 'static_pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

end
