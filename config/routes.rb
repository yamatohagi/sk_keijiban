Rails.application.routes.draw do
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/update'
  # get 'posts/edit'
  # get 'posts/destroy'
  # get 'posts/show'
  # get 'posts/index'

  resources :posts do
    collection do
      get :search
    end
  end
end
