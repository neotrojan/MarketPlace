class Sale < ApplicationRecord

	before_create :generate_guid


	#La vendita di un contenuto può essere fatto più volte
	belongs_to :content

	
	#Implementazione degli state di sicurezza dei pagamenti
	include AASM
	aasm column: 'state' do
		#stato di partenza di una transazione
		state :sleeping, :initial => true
    	#Sta processando l'operazione
    	state :running
    	#L'operazione è stata effettuata
    	state :completed
    	#Stato di errore
    	state :errored

    	#Quando siamo su sleeping per passare a running dopo che avviene l'evento charge_card
    	event :running, after: :charge_card do
    		transitions from: :sleeping, to: :running
    	end

    	#Passaggio dallo stato running a completed
    	event :complete do
    		transitions from: :running, to: :completed
    	end

    	#Passaggio dallo stato running a errored
    	event :fail do
    		transitions from: :running, to: :errored
    	end

	end

	#definizione del metodo charge_card (inizio della transazione)
	def charge_card
		begin
			#Sovrascrive altri metodi
			save!
			
			charge = Stripe::Charge.create(
				amount: self.amount,
				currency: "eur",
				card: self.stripe_token,
				description: "vendita di un contenuto"
				) 
			self.update(stripe_id: charge.id)
			#Sovrascrivere le operazioni precedenti
			self.complete!

		#Se c'è qualche problema con la transazione 
		rescue Stipe::StripeError => e
			self.update_attributes(error: e.message)
			self.fail!
		end

	end




	#Gestione generazione guid
	private
		def generate_guid
			#Si creerà in automatico un uuid, in modo randomico
			self.guid = SecureRandom.uuid()
		end


end
