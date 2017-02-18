Rails.application.routes.draw do
  
  
  #Gestione dei contenuti generato da scaffold
  resources :contents

  #Gestione degli utenti gestito da devise
  devise_for :users
  
  root 'pages#home'

  get 'about' => 'pages#about'

  #Gestione dell'acquisto, dando un percorso  un percorso e collegandoci al controller transactions
  post '/compra/:slug', to: 'transactions#create', as: :compra
  #Pagina per scaricare il contenuto acquistato
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup

  #Pagina di gestione della dashboard
  get 'dashboard' => 'pages#dashboard'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
