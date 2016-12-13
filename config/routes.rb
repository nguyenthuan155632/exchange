Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    devise_for :users, controllers: { 
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
    namespace :operator do
      resources :home, only: :index
    end

    namespace :user do
      resources :home, only: :index
    end
    root 'home#index'
  end
  
  get '/:locale' => 'home#index'
  match '*a', :to => 'errors#routing', via: :get
end
