#app.rb




#Les lignes suivantes dans app.rb vont te permettre d'éviter les require de gem :
# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;)
require 'bundler'
require 'pry'
Bundler.require





#Les lignes suivantes dans app.rb vont te permettre d'appeler facilement les autres fichiers de classe
$:.unshift File.expand_path("./../lib", __FILE__)






# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/app/scrapper'
#require_relative 'lib/app/email_sender'
#require_relative 'lib/views/index'
#require_relative 'lib/views/done'
#require_relative 'lib/app/store_into_json'
#require_relative 'lib/app/store_into_spreadsheet'
#require_relative 'lib/app/store_into_csv'


# Open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc etc

list_all_emails = Scrapper.new

puts "voici l'array de 10 emails : \n "
puts list_all_emails.read_and_return
puts "fini"

binding.pry

puts "end of files"




