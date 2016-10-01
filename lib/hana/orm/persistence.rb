module Hana
  module Persistence
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def create(attributes = {})
        model = new(attributes)
        model if model.save
      end

      private

      def map_row_to_object(row)
        return nil unless row
        model = new

        columns.each_with_index do |attribute, index|
          model.send("#{attribute}=", row[index])
        end

        model
      end
    end

    def save
      new_record || update_record
      reload
      self
    end

    alias save! save

    def update(attributes)
      attributes.each do |key, value|
        send("#{key}=", value)
      end
      save
    end

    def reload
      @id ||= (Database.execute "SELECT last_insert_rowid()")[0][0]
      row = Database.execute "SELECT * FROM #{table_name} where id= #{@id}"

      columns.each_with_index do |column, index|
        send("#{column}=", row[0][index])
      end
    end

    private

    def new_record
      return false if created_at
      @created_at = Time.now.to_s

      Database.execute <<-SQL, new_record_values
        INSERT INTO #{table_name} (#{columns.join(', ')}) VALUES (#{new_record_placeholders})
      SQL
    end

    def update_record
      Database.execute <<-SQL, new_record_values
        UPDATE #{table_name} SET #{update_record_placeholders} WHERE id= #{id}
      SQL
    end

    def new_record_values
      values = columns.map { |column| send(column) }
    end
  end
end
