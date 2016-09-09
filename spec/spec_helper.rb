require "simplecov"
SimpleCov.start "rails"
require "coveralls"
Coveralls.wear! "rails"
require "todo/config/application"
require 'rspec'
require 'rack/test'
 
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['RACK_ENV'] = 'test'