Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'contacts#index'
  resource :session, only: [:new,:create,:destroy]
  resources :team_members, only: [:create,:new]
  resources :teams, only: [:show,:create,:new] do
    get '/settings', to: 'settings#show'
    resources :team_members, only: [:index,:show] do
      resources :messages, only: [:index,:create,:destroy]
    end
    resources :contacts do
      resources :tasks
    end
    resources :reports, except: [:edit,:update]
  end

  
end
