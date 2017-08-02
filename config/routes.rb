Rails.application.routes.draw do
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

  resources :groups do
    resources :affiliations, controller: "groups/affiliations"
  end
end
