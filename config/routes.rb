Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts 

  resource :profile, only: [:show, :edit, :update]

  namespace :api, defaults: {format: :json} do 
    scope '/posts/:post_id' do 
      resource :like, only: [:show, :create, :destroy]
      resources :comments, only: [:index, :create, :destroy]
    end
  end
end
