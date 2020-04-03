Rails.application.routes.draw do
  namespace :api do
    resources :locations
    resources :airports, only: [:index, :show] do
      collection do
        get :search
      end
    end
  end
end
