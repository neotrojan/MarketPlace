class TransactionsController < ApplicationController

	
	def create
		#La transazione andrà a prendere il contenuto dal db tramite lo slug 
		content = Content.find_by!(slug: params[:slug])
		sale = content.sales.create(
			amount: (content.price * 100).floor, 
			email_acquirente: current_user.email,
			email_venditore: content.user.email,
			stripe_token: params[:stripeToken])
		sale.running!
		#Lo stato è completato allora facciamo il primo redirect
		if sale.completed?
		
			#a questo punto viene fatto una redirect verso la pagina pickup
			redirect_to pickup_url(guid: sale.guid)
		else

			#Se c'è qualche problema con la transazione 
			redirect_to content_path(content), notice: @error
		end

	end

	#Fine della transazione
	def pickup

		@sale = Sale.find_by!(guid: params[:guid])
		@content = @sale.content

	end



end