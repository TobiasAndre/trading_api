# Gem install
bundle check || bundle install
# database setup
bundle exec rails db:drop
# creating a database
bundle exec rails db:create
# run pending migrations
bundle exec rails db:migrate
# run tests
bundle exec rspec
# importing data from csv files
bundle exec rails db:seed
# Run our server
bundle exec puma -C config/puma.rb