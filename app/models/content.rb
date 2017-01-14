class Content < ApplicationRecord
	#Il contenuto appartiene a un solo utente e risolvere un problema su rails 5
	belongs_to :user, optional: true
end
