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
  get '/about', to: 'static_pages#about'

  authenticated :patient do
   root :to => 'patients#show', :as => 'authenticated_patient_root_path'
  end

  authenticated :practice do
   root :to => 'practices#show', :as => 'authenticated_practice_root_path'
  end

 root 'static_pages#home'

end
