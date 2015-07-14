Rails.application.routes.draw do

  resources :decodings, only: [:index, :create, :destroy]
  root 'decodings#index'

end
