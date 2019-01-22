#appel du fichier a tester
require_relative '../lib/app/scrapper' #sans extension

require '../lib/app/scrapper'
require '../lib/app/email_sender'
require '../lib/views/index'
require '../lib/views/done'
require '../app'

##############  les TESTS   ##################

#voici une structure de test basique
describe "blablabla" do
	it "blablabla" do
		expect(fonction?(arguments)).to eq(resultat)
	end
end

#A toi de jouer



