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
      resources :operators
    end

    namespace :user do
      get 'history', to: "reservations#get_list"
      resources :home, only: :index
      resources :kycs
      resources :users, only: [:show, :edit, :update]
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
