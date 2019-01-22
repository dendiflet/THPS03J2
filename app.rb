#app.rb

#Les lignes suivantes dans app.rb vont te permettre d'éviter les require de gem :
require 'bundler'
Bundler.require

#Les lignes suivantes dans app.rb vont te permettre d'appeler facilement les autres fichiers de classe
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/fichier_1'
require 'views/fichier_2'



