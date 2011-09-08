Pipegems::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :rubygems do |rubygems|
    resources :rubygem_versions, :as => :versions
  end

  root :to => 'rubygems#index'
end
