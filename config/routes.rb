Trekkr::Application.routes.draw do
  resources :photos, only: [:new, :create]

  match '/callback', to: "photos#callback"
  
  root to: 'photos#index'
end
