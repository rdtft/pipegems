Pipegems::Application.routes.draw do

  devise_for :users

  resources :rubygems do |rubygems|
    resources :rubygem_versions, as: :versions
  end

  root :to => 'rubygems#index'
end
