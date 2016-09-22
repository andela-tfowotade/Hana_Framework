module Hana
  module QueryHelpers
    def create_table
      Database.execute <<-SQL
        CREATE TABLE IF NOT EXISTS #{@table_name} ( #{table_properties} )
      SQL
    end

    def to_table(table_name)
      @table_name = table_name
    end

    def table_name
      @table_name
    end

    def property(column_name, column_attributes)
      @properties ||= {}
      @properties[column_name] = OpenStruct.new(column_attributes)
      attr_accessor column_name
    end

    def properties
      @properties[:id] = OpenStruct.new(type: "integer", primary_key: true)
      @properties[:created_at] = OpenStruct.new(type: "varchar(10)")
      @properties
    end

    def new_record_placeholders
      (["?"] * properties.size).join(", ")
    end

    def update_record_placeholders
      columns.map { |property| "#{property}=?" }.join(", ")
    end

    def query_string(column_attributes)
      query_builder = []
      query_builder << column_attributes.type
      query_builder << "primary key autoincrement" if column_attributes.primary_key
      query_builder << "not null" unless column_attributes.nullable || column_attributes.nullable.nil?
      query_builder.join(" ")
    end

    def table_properties
      attr_accessor :id, :created_at
      query_holder = []

      properties.each do |column_name, column_attributes|
        query_holder << "#{column_name} #{query_string(column_attributes)}"
      end
      query_holder.join(", ")
    end

    def columns
      properties.keys
    end
  end
end
