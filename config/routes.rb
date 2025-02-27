Rails.application.routes.draw do
  root "appointments#index"

  resources :appointments, only: [:index, :show, :new, :create, :update, :destroy] do
    member do
      patch :cancel
    end
  end

  resources :patients
  resources :doctors
end
