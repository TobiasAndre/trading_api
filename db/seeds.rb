# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "downloading locodes zip file..."
filename = FileDownloader.download(Rails.application.credentials[:locode_zip_url])
puts "unziping file..."
Unzipper.run(filename, Rails.application.credentials[:zip_dir])
puts "importing locodes... this process took a lot of time... WAIT"
LocodeImporter.new.run
puts "FINISH!"