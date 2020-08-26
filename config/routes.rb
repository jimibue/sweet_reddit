Rails.application.routes.draw do
  root "subs#index"
  resources :subs

  #http method  #uri
  get "/myyoyo/:hotsauce", to: "yoyos#fred", as: "tony"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
