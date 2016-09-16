$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift File.expand_path("../../spec", __FILE__)

require "simplecov"
SimpleCov.start
require "coveralls"
Coveralls.wear!
require "hana"
require "todo/config/application"
require "rspec"
require "rack/test"

ENV["RACK_ENV"] = "test"

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  conf.include FactoryGirl::Syntax::Methods

  conf.before(:suite) do
    FactoryGirl.find_definitions
  end
end

RSpec.shared_context type: :feature do
  require "capybara/rspec"
  before(:all) do
    app = Rack::Builder.parse_file(
      "#{__dir__}/todo/config.ru"
    ).first
    Capybara.app = app
  end
end
