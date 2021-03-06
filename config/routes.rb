Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    devise_for :users, controllers: { 
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
    devise_for :operators, controllers: {
      sessions: 'operators/sessions',
      registrations: 'operators/registrations',
      passwords: 'operators/passwords'
    }
    namespace :operator do
      resources :home, only: :index
      resources :stores
      resources :reservations, only: [:index] do
        collection do
          get :jpy_btc
        end
      end

      post 'update_status', to: 'reservations#update_status'
      resources :kycs, only: [:edit, :update]
      resources :users, only: [:index, :show, :edit, :update, :destroy]

      post 'kycs/:id/confirm' => 'kycs#confirm', as: 'confirm_kyc'
      resources :operators, only: [:index, :show] do
        member do
          get :get_shop
        end
      end
      resources :aggregates, only: :index do
        collection do
          post  :update_rate
          post  :update_percent
        end
      end
    end

    namespace :user do
      get 'history', to: "reservations#get_list"
      resources :home, only: :index
      resources :kycs
      resources :users, only: [:show, :edit, :update]
      resources :stores, only: [:index]
      resources :reservations, only: [:new, :create, :show] do
        collection do
          get :new_jpy_btc
          post :create_jpy_btc
          get :new_btc_address
          post :create_btc_address
        end
      end
    end
    get 'btc_value', to: "user/reservations#btc_value"
    get 'jpy_value', to: "user/reservations#jpy_value"
    root 'home#index'
  end
  
  get '/:locale' => 'home#index'
  match '*a', :to => 'errors#routing', via: :get
end
