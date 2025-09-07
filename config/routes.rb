Rails.application.routes.draw do
  root to: "tasks#index"
  get 'search', to: 'searches#search', as: 'search'
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      patch :toggle
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
