Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hosts, only: :index, defaults: { format: :json } do
    resources :status_history, only: :index
  end
end
