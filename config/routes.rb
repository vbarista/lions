Rails.application.routes.draw do
  resources :groups
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # deviceのsessionsコントローラーをカスタマイズ
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :events do
    member do
      get 'edit_confirmation'
      put 'update_confirmation'
    end
  end

  root to: 'events#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
