#store_into_csv

require 'csv'

class StoreIntoCsv

  def store(mail)
    #crée un fichier et écris dedans
    CSV.open("json_emails_list.csv", "w") do |csv| mail.each_with_index do |i|
    csv << mail[i] end
  end
end

end