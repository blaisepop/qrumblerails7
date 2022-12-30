Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dynamic_redirections#index'

  resources :dynamic_redirections, param: :key_value, except: [:show]
  get '/dynamic_redirections/:key_value', to: 'dynamic_redirections#redirect'


end
