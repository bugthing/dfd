# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby "~> 2.7.0"

gem "dry-system"
gem "dry-auto_inject"
gem "dry-validation"
gem "dry-monads"
gem "rom"
gem "rom-sql"
gem "pg"
gem "hanami-controller"
gem "hanami-router"
gem "hanami-view"
gem "hanami-assets"
gem "dotenv"
gem "rake"
gem "puma"
gem "omniauth-google-oauth2"
gem "warden"

group :test, :development do
  gem "pry"
end

group :development do
  gem "foreman"
  gem "guard"
  gem "guard-rack"
end

group :test do
  gem "standard"
  gem "rspec"
  gem "database_cleaner-sequel"
  gem "rack-test"
  gem "capybara"
end
