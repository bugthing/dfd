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
gem "dotenv"
gem "rake"
gem "puma"

group :test do
  gem "pry"
  gem "standard"
  gem "rspec"
  gem "database_cleaner-sequel"
  gem "rack-test"
  gem "capybara"
end
