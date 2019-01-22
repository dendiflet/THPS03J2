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
require_relative 'lib/app/store_into_json'
#require_relative 'lib/app/email_sender'
require_relative 'lib/views/index'
#require_relative 'lib/views/done'
#require_relative 'lib/app/store_into_spreadsheet'
require_relative 'lib/app/store_into_csv'


# Open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc etc



def get_and_resize_data
	#création d'une instance scrapper
	list_all_emails = Scrapper.new

	allist = list_all_emails.read_and_return
	puts "######################\n voici l'array de 10 emails : \n "
	puts allist.class
	puts allist
	puts "#################      fini"

  #resize l'array de hash en hash simple et 
	allist2 = allist.reduce Hash.new, :merge
	puts "######################\n voici le hash de 10 emails : \n "
	puts allist2.class 
	print allist2
	puts "\n#################      fini"

	return allist2

end




def create_json(mails)
    File.open("database/json_emails_list.json","w") do |f|
      f.write(mails)
     end
end

def create_spreadsheet(mails)

end

def create_csv(imput)
    #crée un fichier et écris dedans
    CSV.open("database/csv_emails_list.csv", "w") do |csv|
    csv << [imput]
  end
end




def perform

  #va rechercher le resultat du scrapp
  @mail_hash = get_and_resize_data


  #création d'une instance qui va demander sous quel format le ranger
  extension_choice = ChooseWichExtensionFileToStoreCityTownhallMails.new
  #recuperation du resultat
  @extension_num = extension_choice.read_and_return

#puts @extension_num

  ####appel la bonne def en fonction du choix utilisateur
  case @extension_num

  when 1
    create_json(@mail_hash)
    puts "case passé JSON"
  when 2
    #new instance


  	puts "case passé spreadsheet"
 
  when 3
    #create new instance
  	#create_csv = StoreIntoCsv.new
  	#create_csv.store(@mail_hash)
  	#pust "case passé CSV"

puts @mail_hash

    create_csv(@mail_hash)
    puts "case passé CSV"

  end
  ########  création de la data finie

end



perform

binding.pry

puts "end of files"




