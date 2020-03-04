echo 'waiting database start...'
sleep 30
echo 'starting bundle proccess'
# Gem install
bundle check || bundle install
# creating a database
bundle exec rails db:create
# run pending migrations
bundle exec rails db:migrate
# run tests
bundle exec rspec
# import data from csv files
bundle exec rails db:seed
# Run our server
bundle exec puma -C config/puma.rb