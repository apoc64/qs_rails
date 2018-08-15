Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :create, :show, :update, :destroy]
      resources :meals, only: [:index]
      namespace :meals do
        get '/:id/foods', to: 'foods#index'
        post '/:meal_id/foods/:food_id', to: 'foods#create'
      end
    end
  end
end
