class User < Hana::BaseModel
  to_table :users
  property :user_id, type: :integer, primary_key: true
  property :name, type: :text, nullable: false
  property :email, type: :text, nullable: false
  property :title, type: :text
  property :description, type: :text
  create_table
end
