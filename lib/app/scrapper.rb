puts "\e[H\e[2J"    #clear le terminal
require 'pry'
require 'nokogiri'
require 'open-uri'


class Scrapper

	attr_accessor :all_emails, :name_and_url, :name_and_email, :city_mail
	@all_emails = []




	def initialize
		url = "https://www.annuaire-des-mairies.com/val-d-oise.html"
		@name_and_url = get_townhall_urls(url)

		@all_emails = get_all_email(@name_and_url)
#		print "salut ca va? devrait s'afficher la liste de 10 emails :"
#		print @all_emails
#		puts "\n alors?"
		
		#vd_townhall_emails = get_townhall_email(@name_and_url)

		return @all_emails
	end





	def get_townhall_urls(url)
		@name_and_url = []
		scrappagetotal = Nokogiri::HTML(open(url))
		news_links_dirty = scrappagetotal.css("tr").css("a").select{|link| link['class'] == "lientxt"}
		news_links_dirty.each{|link| @name_and_url << { "name" => link.text, "url" => "https://www.annuaire-des-mairies.com/#{link['href'].to_s.slice!(1..-1)}"}}
#		puts "ici 1ere étape : name and url"
#		puts @name_and_url
#		puts "alors?"
#		puts "\n\n\n\n\n"

		return @name_and_url
	end

	def get_all_email(name_and_url)
	  @name_and_email = []
	  @name_and_url.map.with_index do |value, i|

#   puts value["url"]

	  @name_and_email << { value["name"] => get_townhall_email(value["url"]) }




#		puts "ici dernière étape, il va chercher l'email de la mairire et l'enregistre dans ###### name and email ########"
#		puts "#{get_townhall_email(value["url"])}"
#		puts "est enregistré dans la liste"

	  break if i == 10
	end  
    
#    puts "ici la liste des 10 emails"	
#		puts @name_and_email
#		puts "alors?"
#		puts "\n\n\n\n\n"	
	  return @name_and_email
	end



	def get_townhall_email(townhall_url)
	  #townhall_url.each do |eachcitysite|
		  city_doc_all = Nokogiri::HTML(open(townhall_url))
		  cty_twnhall = city_doc_all.xpath("//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]") 		#ultra presci...
	    @city_mail = cty_twnhall.to_s.slice(4...-5)
#		puts "ici city_mail, un seul doit s'afficher"
#		puts @city_mail
#		puts "alors?"
#		puts "\n\n\n\n\n"	
		return @city_mail
	end



	def read_and_return
		puts "normalement doit s'afficher 10 email a la demande"
		#print "#{@all_emails}\n"
		return @all_emails
	end



end

