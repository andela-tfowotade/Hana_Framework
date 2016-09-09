$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "simplecov"
SimpleCov.start "rails"
require "coveralls"
Coveralls.wear! "rails"

# Dir['./spec/todo/**/*.rb'].sort.each{ |f| require f }

require "todo/config/application"
require 'rspec'
require 'rack/test'


ENV['RACK_ENV'] = 'test'
