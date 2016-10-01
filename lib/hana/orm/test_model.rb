require_relative "base_model"

class Person < Hana::BaseModel
  to_table :persons
  property :name, type: :text
  property :age, type: :integer
  create_table
end

person = Person.new(name: "Temi", age: 14)
person.save
puts person.name
# person.update(name: "Sarah")
# puts Person.all.count
# last_name =  Person.find(5)
# last_name.destroy
# Person.destroy(8)
# puts Person.all.count
