class Content < ActiveRecord::Base
	#Il contenuto appartiene a un solo utente e risolvere un problema su rails 5
	belongs_to :user, optional: true


	#--------------------Upload cover ----------------------------
	#Serve per fare l'upload delle immagini di copertina
	has_attached_file :cover
	#Tipi di file ch possono essere caricati
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/,
	#Messaggio se non viene inserito un formato corretto
  	message: "Solo le immagini sono supportate"

  	#---------------------Upload contenuto-------------------------
  	#Serve per fare l'upload del contenuto
	has_attached_file :allegato
	#Tipi di file che possono essere caricati: immagine, word, xml, powerpoint, pdf, excel, video, audio 
  	validates_attachment_content_type :allegato, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'audio/mpeg', 'audio/mp3'],
	#Messaggio se non viene inserito un formato corretto
  	message: "Formato non supportato"

end
