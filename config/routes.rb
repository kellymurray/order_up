Rails.application.routes.draw do

    # get '/dishes/:id', to: 'dishes#show'
    # get '/chefs/:id', to: 'chefs#show'
    # get '/chefs/:id/ingredients', to: 'ingredients#index'

    resources :dishes, only: [:show]
    resources :chefs, only: [:show] do
      resources :ingredients, only: [:index]
  end

end
