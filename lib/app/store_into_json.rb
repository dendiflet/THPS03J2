# store_into_JSON

class Json_storer

	def create_and_store(mail_list)
    File.open("../../db/email.json","w") do |f|
      f.write(mail_list)
    end
		
	end

end


