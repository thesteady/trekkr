Trekkr::Application.routes.draw do
  resources :photos, only: [:new, :create]
  root to: 'photos#index'
end
