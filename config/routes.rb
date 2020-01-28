Rails.application.routes.draw do


  devise_for :patients,  path: 'patients'
  devise_for :practices, path: 'practices'
  get 'static_pages/about'
  get 'static_pages/home'

  get '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

end
