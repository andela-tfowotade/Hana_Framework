require_relative 'query_helpers'
require 'ostruct'
require_relative 'persistence'
require_relative 'database'

module Hana
  class BaseModel
    extend Hana::QueryHelpers
    include Hana::Persistence

    attr_accessor :errors

    Database.connect

    def initialize(attributes = {})
      @errors ||= []
      attributes.each { |column_name, value| send("#{column_name}=", value) }
    end

    def destroy
      Database.execute "DELETE FROM #{table_name} where id=#{id}"
    end

    def self.destroy(id)
      Database.execute "DELETE FROM #{table_name} where id=#{id}"
    end

    def self.find(id)
      row = Database.execute("SELECT * FROM #{table_name} WHERE id= #{id}").first
      map_row_to_object(row)
    end

    def self.all
      rows = Database.execute "SELECT * FROM #{table_name}" 
      rows.map { |row| map_row_to_object(row) }
    end

    def self.last
      row = Database.execute <<-SQL
        SELECT * FROM #{table_name} ORDER BY id DESC LIMIT 1
      SQL
      map_row_to_object(row[0])
    end

    def self.first
      row = Database.execute <<-SQL
        SELECT * FROM #{table_name} ORDER BY id LIMIT 1
      SQL
      map_row_to_object(row[0])
    end

    def self.destroy_all
      Database.execute "DELETE FROM #{table_name}"
      Database.execute "DELETE FROM sqlite_sequence WHERE name=#{table_name}"
    end

    def self.where(attributes = {})
      search_values = attributes.values
      search_place_holder = attributes.keys.map {|key| "#{key}=? "}.join('and')

      rows = Database.execute <<-SQL, search_values
        SELECT * FROM #{table_name} where #{search_place_holder}
      SQL

      rows.map { |row| map_row_to_object(row) }
    end

    private

    def method_missing(method_name, *_args)
      if self.class.methods.include?(method_name)
        return self.class.send(method_name)
      end
    end
  end
end
