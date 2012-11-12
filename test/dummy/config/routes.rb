Rails.application.routes.draw do
  resources :welcome

  mount Launchpad::Engine => "/launchpad"

  root to: 'welcome#index'
end
