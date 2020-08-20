Rails.application.routes.draw do
  devise_for :users
  resources :blades
  resources :basketblades, only: [:index, :create] do
    member do
      put :checkout
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "blades#index"
end
