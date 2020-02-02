Rails.application.routes.draw do


  devise_for :patients,  path: 'patients', controllers: { sessions: 'patients/sessions', registrations: 'patients/registrations' }
  devise_for :practices, path: 'practices', controllers: { sessions: 'practices/sessions', registrations: 'practices/registrations' }
  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/newappointment'

  get '/about', to: 'static_pages#about'
  get '/calendar', to: 'calendar#calendar'
  get '/newappointment', to: 'static_pages#newappointment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

end
