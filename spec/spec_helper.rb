RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before do
    DatabaseCleaner.clean
  end
end

require "pry"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }

require_relative "../config/application"
Dfd::Application.finalize!

require "database_cleaner/sequel"
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation

