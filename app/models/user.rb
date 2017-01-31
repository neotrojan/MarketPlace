class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Più contenuti appartengono a un utente
  has_many :contents

  #Il campo name, durante la registrazione deve essere obbligatorio
  validates :name, presence: true

end
