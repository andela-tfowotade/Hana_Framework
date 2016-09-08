require_relative 'query_helpers'
require 'ostruct'
require_relative 'persistence'
require_relative 'database'

module Hana
  class BaseModel
    extend Hana::QueryHelpers
    include Hana::Persistence

    Database.connect

    def initialize(attributes = {})
      @errors ||= []
      attributes.each { |column_name, value| send("#{column_name}=", value) }
    end
  end
end
