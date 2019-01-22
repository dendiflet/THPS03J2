#app.rb

#Les lignes suivantes dans app.rb vont te permettre d'éviter les require de gem :
# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;)
require 'bundler'
require 'pry'
Bundler.require

#Les lignes suivantes dans app.rb vont te permettre d'appeler facilement les autres fichiers de classe
$:.unshift File.expand_path("./../lib", __FILE__)

# lignes qui appellent les fichiers de class, 
# une classe par fichier, une fonction par classe (j'ai essayé)
require_relative 'lib/app/scrapper'
require_relative 'lib/app/store_into_json'
#require_relative 'lib/app/email_sender'
require_relative 'lib/views/index'
require_relative 'lib/views/done'
#require_relative 'lib/app/store_into_spreadsheet'
require_relative 'lib/app/store_into_csv'

# Open bar pour tester ton application. Tous les fichiers importants sont chargés

def get_and_resize_data
	#création d'une instance scrapper
	list_all_emails = Scrapper.new
  # recuperation de l'array de hash d'emails
	allist = list_all_emails.read_and_return
  #resize l'array de hash en hash simple et 
	allist_resized = allist.reduce Hash.new, :merge   # <- merci maxime
  #puts "######################\n voici le hash de 10 emails : \n "
	#puts allist_resized.class 
	#print allist_resized
	#puts "\n##########################      fini"
	return allist_resized
end

def perform
  # va rechercher le resultat du scrapp dans le fichier lib/app/scrapper.rb
  @mail_hash = get_and_resize_data
  # création d'une instance qui va demander sous quel format le ranger
  # en appelant le fichier lib/views/index.rb
  extension_choice = ChooseWichExtensionFileToStoreCityTownhallMails.new
  # recuperation du resultat
  @extension_num = extension_choice.read_and_return
  ########### appel la bonne def en fonction du choix utilisateur
  case @extension_num
  when 1
    create_json = StoreIntoJSON.new
    create_json.create_file_and_write_in(@mail_hash)
    puts "fichier JSON créé"
  when 2  #n'est pas encore fonctionnel
    #new instance
    create_spreadsheet = StoreIntoSpreadsheet.new
    create_spreadsheet.create_file_and_write_in(@mail_hash)
  	puts "spreadsheet créé"
  when 3
    #create new instance
  	create_csv = StoreIntoCSV.new
  	create_csv.create_file_and_write_in(@mail_hash)
  	puts "fichier CSV créé"
  when 0
    return
  end
  ########  création/remplissage du fichier data fini
  bye = SayJobDone.new
end

perform
#binding.pry
puts "Program end !"




