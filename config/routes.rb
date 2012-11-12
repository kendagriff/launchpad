Launchpad::Engine.routes.draw do
  resources :sessions

  match '/auth/google_apps/callback' => 'sessions#create', via: [:post, :get]

  match '/logout' => 'sessions#destroy'
end
