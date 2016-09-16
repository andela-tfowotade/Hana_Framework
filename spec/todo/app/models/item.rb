class Item < Hana::BaseModel
  to_table :item
  property :id, type: :integer, primary_key: true
  property :title, type: :text, nullable: false
  property :body, type: :text, nullable: false
  property :todo_id, type: :integer, nullable: false
  property :created_at, type: :text, nullable: false
  create_table
end
