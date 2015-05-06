Launchpad::Engine.routes.draw do
  resources :sessions

  match '/auth/google_oauth2/callback' => 'sessions#create', via: [:post, :get]

  match '/logout' => 'sessions#destroy'
end
