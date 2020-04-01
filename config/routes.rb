Rails.application.routes.draw do
  namespace :api do
    resources :airports
  end
end
