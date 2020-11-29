Rails.application.routes.draw do
  get '/', to: "homes#top"
  devise_for :users
  resources :users do
    member do
      get 'top'
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
