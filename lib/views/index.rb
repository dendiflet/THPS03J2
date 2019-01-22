#index.rb
class ChooseWichExtensionFileToStoreCityTownhallMails
	@extension_choice = Integer
  @@i = 0
  #a la création de l'instance, fait choisir l'utilisateur
  def initialize
    ARGV.clear
    puts "vers quel sorte de fichier souhaite tu envoyer les emails"
    puts " 0 -> quit ;   1 -> Json ;   2 -> spreadsheet  ; 3 ->  CSV  "
    print " ->  "
    @extension_choice = gets.chomp.to_i
    #si mauvais chiffre/numéro, recommence 3 fois, si lettres, direct au revoir
    if (1..4).cover?(@extension_choice)
  		puts "ok, création du fichier imminente"
  	  return
    elsif @extension_choice == 0  # pb, les lettres sont comme = 0...
        puts "au revoir"
        return @extension_choice = 0      
    else
      @@i = @@i + 1
      puts "saisir un des numéros indiqué svp"
      if @@i > 4
        puts "au revoir"
        return @extension_choice = 0
      end 
      #inception, recommence la saisie
      initialize
  	end
  end
  #permet de recup le choix quand je veux
  def read_and_return
    case @extension_choice  # pour ne pas afficher un   
    when 1
      puts "L'extension choisie est le .JSON !"
    when 2
      puts "les datas seront sockées dans un Spreadsheet !"
    when 3
      puts "L'extension choisie est le .CSV !"
    end
    return @extension_choice
  end
end