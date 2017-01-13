Rails.application.routes.draw do
  
  
  #Gestione dei contenuti generato da scaffold
  resources :contents

  #Gestione degli utenti gestito da devise
  devise_for :users
  
  root 'pages#home'

  get 'about' => 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
