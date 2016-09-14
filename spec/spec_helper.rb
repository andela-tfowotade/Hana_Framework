$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"
SimpleCov.start
require "coveralls"
Coveralls.wear!

require "todo/config/application"
require "rspec"
require "rack/test"

ENV["RACK_ENV"] = "test"
