#store_into_csv

require 'csv'

class StoreIntoCSV

  def create_file_and_write_in(imput)
    #crée un fichier et écris dedans
    CSV.open("database/csv_emails_list.csv", "w") do |csv|
      imput.each do |k , v|
        csv << [k, v]
      end
    end
  end

end





