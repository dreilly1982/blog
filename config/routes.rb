Rails.application.routes.draw do
  concern :commentable do
    resources :comments
  end

  scope :api do
    resources :posts, only: [:index]
    resources :categories, concerns: :commentable, shallow: true do
      resources :posts, concerns: :commentable
    end
  end

  get '*unmatched_route', to: 'application#index'
  root to: 'application#index'
end
