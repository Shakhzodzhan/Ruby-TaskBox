Rails.application.routes.draw do
  get 'settings/index', as: 'settings'
  root 'users#index'
  resources :tag_associations
  resources :tags
  resources :tasks
  resources :categories
  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    passwords: 'users/passwords'
                                  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
