Pipegems::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' } do
    get '/users/auth/:provider' => 'omniauth_callbacks#passthru'
  end

  resources :rubygems do |rubygems|
    resources :rubygem_versions, :as => :versions
  end

  resources :gems, only: [:index, :show], constraints: { id: /pipe-.+.gem/ }

  root :to => 'rubygems#index'
end
