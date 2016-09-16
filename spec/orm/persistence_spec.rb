require "spec_helper"

describe "Persistence" do
  describe ".create" do
    it "creates a new record in the database" do
      expect{ Todo.create(title: "Temi", body: "this is the body") }.to change{ Todo.all.count }.by(1)
      Todo.destroy_all
    end
  end

  describe ".save" do
    it "persists the record in the database" do
      todo = Todo.new(title: "Temi", body: "this is the body")

      expect{ todo.save }.to change{ Todo.all.count }.by(1)
      Todo.destroy_all
    end
  end
end
