source 'https://rubygems.org'
#Per far funzionare heroku, aggiungere la versione di ruby
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#Per implementare il CSS materialize
gem 'materialize-sass'

#Per far funzionare materialize su windows
gem 'coffee-script-source', '1.8.0'

# GEM per device 
gem 'devise'

#Gemma per far funzionare la registrazione su Windows
gem 'bcrypt', platforms: :ruby


#Gemma per far funzionare paperclip
gem "paperclip", "~> 5.0.0"
#Gemma per far funzionare paperclip su heroku
gem 'aws-sdk', '~> 2.3'

# Gemme peer l'impaginazione
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-materialize'

#Gemma per migliorare l'idicizzazione di un contenuto
gem 'friendly_id', '~> 5.1.0'

#Rendere sicuro il codice
gem 'dotenv-rails', :groups => [:development, :test]

#Gem per i pagamenti
gem 'stripe'

#Gem per la sicurezza dei pagamenti
gem 'aasm'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  #Gemma per il developmen, db
  gem 'sqlite3'
end

#Gruppo per quando si è online, produzine
group :production do
	gem 'pg'
	gem 'rails_12factor'
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
