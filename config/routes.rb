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
    end

    namespace :user do
      resources :home, only: :index
      resources :kycs
      resources :reservations, only: [:new, :create]
    end
    root 'home#index'
  end
  
  get '/:locale' => 'home#index'
  match '*a', :to => 'errors#routing', via: :get
end
