# store_into_JSON

class StoreIntoJSON

	def create_file_and_write_in(mail_list)
    File.open("database/email.json","w") do |f|
      f.write(mail_list)
    end
		
	end

end


