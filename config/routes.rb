Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :zones,   only: [:index, :show]
      resources :battles, only: [:show]
      resources :players, only: [:show, :update]
      resources :items,   only: [:index, :show]
      resources :slots,   only: [:index, :show, :create, :update]
    end
  end
end
