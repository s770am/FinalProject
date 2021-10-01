Rails.application.routes.draw do
  get 'notes/create'
  get 'notes/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  # root 'contacts#show'
  resource :sessions, only: [:new,:create,:destroy]

  resources :team_members, only: [:create,:new]
  resources :teams, only: [:create,:new] do
    get '/settings', to: 'settings#show'
    resources :team_members, only: [:index,:show] do
      resources :messages, only: [:index,:create,:destroy]
    end
    resources :contacts do
      resources :tasks
      resources :notes, only: [:create,:update,:destroy]
    end
    resources :reports, except: [:edit,:update]
  end

  
end
