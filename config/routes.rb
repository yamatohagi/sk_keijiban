Rails.application.routes.draw do

  root to: 'posts#index'
  resources :posts do
    collection do
      get :search
    end
  end

  namespace :pages do
    get :agreement
    get :about
  end
end
