Rails.application.routes.draw do

  resources :questions
 
    root "main#index"
end
