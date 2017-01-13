class Content < ApplicationRecord
	#Il contenuto appartiene a un solo utente
	belongs_to :user
end
