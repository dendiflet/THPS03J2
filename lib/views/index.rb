
class ChooseWichExtensionFileToStoreCityTownhallMails
	@extension_choice = Integer


	#a la création de l'instance, fait choisir l'utilisateur
  def initialize
  	ARGV.clear
  	puts "vers quel sorte de fichier souhaite tu envoyer les emails"
  	puts "    1 -> Json ;   2 -> spreadsheet  ; 3 ->  CSV  "
  	print " ->  "
  	@extension_choice = gets.chomp.to_i

    #si mauvais imput, recommence 3 fois
    i = 0
  	unless @extension_choice != [1..3] # && i <4
      i += 1
  		puts "saisi un bon choix"
  		#inception, recommence la saisie
  		
  		initialize

  	else
  		puts "ok, création du fichier imminente"
  	return
  	end
  end

  #permet de recup le choix quand je veux
  def read_and_return
  	puts "voici le choix d'extension : #{@extension_choice}  !"
  	return @extension_choice
  end

end