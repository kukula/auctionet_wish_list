Rails.application.routes.draw do
  root to: 'items#index'

  resources :items, only: %i{index show}
  resources :categories, only: :index do
    resources :items, only: :index
  end
  resources :wished_items, only: %i(index show create destroy)
end
