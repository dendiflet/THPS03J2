#done.rb
class SayJobDone
	def initialize
	  puts "le scrapping a été effectué"
	  if @extension_num != 0
	    puts "le fichier de data a été créé"
	  else
	  	puts "rien a été sauvegardé"
	  end
	  puts "\n au revoir\n"
  end 
end