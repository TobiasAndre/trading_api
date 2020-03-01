# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "active_model_serializers", "~> 0.10.10"
gem "bootsnap", ">= 1.4.2", require: false
gem "down", "~> 5.0"
gem "jwt"
gem "lograge"
gem "logstash-event"
gem "open_api-rswag"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "redis"
gem "redis-rails"
gem "rest-client"
gem "rswag"
gem "rubyzip"
gem "will_paginate", "~> 3.3"
gem "zip-zip"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"
  gem "rubocop"
  gem "webmock"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "factory_bot_rails"
  gem "fakeredis", require: "fakeredis/rspec"
  gem "ffaker"
  gem "generator_spec"
  gem "rspec-rails", "~> 3.5"
  gem "simplecov"
  gem "vcr"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
