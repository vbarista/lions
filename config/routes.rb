Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # deviceのsessionsコントローラーをカスタマイズ
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :events
  root to: 'events#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
