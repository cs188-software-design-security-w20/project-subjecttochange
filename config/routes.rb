Rails.application.routes.draw do

  devise_for :patients,  path: 'patients', \
    controllers: { \
      sessions: 'patients/sessions',
      registrations: 'patients/registrations' \
    }

  devise_for :practices, path: 'practices', \
    controllers: { \
      sessions: 'practices/sessions',
      registrations: 'practices/registrations' \
    }

  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/dashboard'

  get '/about', to: 'static_pages#about'
  get '/dashboard', to: 'static_pages#dashboard'
  get '/calendar', to: 'patients#calendar'
  get '/practicecalendar', to: 'practices#calendar'
  get '/appointment', to: 'patients#appointment'
  get '/patient_profile', to: 'patients#profile', as: 'patient_profile'
  get '/practice_profile', to: 'practices#profile', as: 'practice_profile'

  authenticated :patient do
    root :to => 'patients#show', :as => 'authenticated_patient_root'
  end

  authenticated :practice do
    root :to => 'practices#show', :as => 'authenticated_practice_root'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :appointments,  only: [:create, :destroy]
end
