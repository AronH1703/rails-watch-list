Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
    # Fyrsta síðana (home page)
  root to: "lists#index"

  # Fyrir Lists
    resources :lists, except: [:edit, :update] do
      resources :bookmarks, only: [:new, :create]
      resources :reviews, only: :create
    end

    # Route til að eyða saved faveorite movies ehv sem fer eftir ID
    resources :bookmarks, only: :destroy
    resources :reviews, only: :destroy
end
