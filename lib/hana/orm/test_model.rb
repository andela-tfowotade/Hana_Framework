require_relative 'base_model'

class Person < Hana::BaseModel
  to_table :persons
  property :name, type: :text
  property :age, type: :integer
  create_table
end

person = Person.new(name: "Temi", age: 14)
puts person.name

