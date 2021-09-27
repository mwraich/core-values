Rails.application.routes.draw do
  resources :selections
  resources :rankings do 
      collection do  
        get :show_create_rankings
        post :create_rankings
      end
    end
  resources :ratings 
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
