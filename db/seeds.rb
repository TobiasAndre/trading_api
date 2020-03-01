# frozen_string_literal: true
puts '==========================================================='
puts "downloading locodes zip file..."
filename = FileDownloader.download(Rails.application.credentials[:locode_zip_url])
puts "unziping file..."
Unzipper.run(filename, Rails.application.credentials[:zip_dir])
puts "importing locodes... this process took a lot of time... WAIT"
LocodeImporter.new.run
puts "FINISH!"
puts '==========================================================='