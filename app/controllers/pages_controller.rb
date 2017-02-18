class PagesController < ApplicationController
  
  #La pagina dashboard deve essere accessibile solo se l'utente è autentificato
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def about
  end

  def dashboard
  	#Usata per la sezione "in vendita"
  	@content = current_user.contents
  	#Usata per la sezione Storico > vendita, se abbiamo fatto una transazione 
  	#e l'email del venditore è la nostra falla comparire qui
  	@sales = Sale.where(email_venditore: current_user.email)
  	#Usata per la sezione Storico > acquisti, se abbiamo fatto una transazione 
  	#e l'email dell'acquirete è la nostra falla comparire qui
  	@purchased = Sale.where(email_acquirente: current_user.email)
  end
  
end
