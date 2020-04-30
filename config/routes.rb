Rails.application.routes.draw do
  namespace :api do
    resources :locations
    resources :airports, only: [:index, :show] do
      collection do
        get 'status' => "airports#status"
        get :search
      end
    end
    get 'weather' => "weathers#current_weather"
  end
end
