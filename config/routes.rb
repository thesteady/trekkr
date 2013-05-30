Trekkr::Application.routes.draw do
  resources :photos, only: [:new, :create]

  match '/callback', to: "photos#new", as: 'callback'
  
  root to: 'photos#index'
end
