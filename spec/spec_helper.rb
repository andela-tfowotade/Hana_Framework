$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "../todoApp/config/application.rb"
require 'rspec'
require 'rack/test'
 
ENV['RACK_ENV'] = 'test'