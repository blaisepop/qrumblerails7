Rails.application.routes.draw do
  get 'dynamic_redirection/new'
  get 'dynamic_redirection/create'
  get 'dynamic_redirection/destroy'
  get 'dynamic_redirection/edit'
  get 'dynamic_redirection/index'
  get 'dynamic_redirection/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dynamic_redirections#index'

  resources :dynamic_redirections, param: :key_value, except: [:show]
  get '/dynamic_redirections/:key_value', to: 'dynamic_redirections#redirect'


end
