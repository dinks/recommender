require "coveralls"
Coveralls.wear!

require "pry"
require "factory_girl"

require "./lib/recommender"

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.warnings = true

  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # config.order = :random
end
