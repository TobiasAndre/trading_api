# Gem install
bundle check || bundle install
# creating a database and pending migrations
bundle exec rails db:create && rails db:migrate
# run tests
bundle exec rspec
# importing data from csv files
bundle exec rails db:seed
# Run our server
bundle exec puma -C config/puma.rb