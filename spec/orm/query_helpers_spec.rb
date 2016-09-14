require "spec_helper"

describe "QueryHelpers" do
  let(:db) { Hana::Database }
  let(:model) { Hana::BaseModel }

  describe ".to_table" do
    it "assigns a table name to an instance variable" do
      model.to_table :users
      table_name = model.instance_variable_get(:@table_name)

      expect(table_name).to eq(:users)
    end
  end

  describe ".property" do
    before { model.property :name, type: :integer }

    it "populates the properties instance variable" do
      property = model.instance_variable_get(:@properties)

      expect(property.keys).to include(:name)
    end

    it "makes the column names attribute accessible" do
      expect(model.new).to respond_to(:name)
    end
  end


  describe ".create_table" do
    it "executes sql query to create database table" do
      expect(db).to receive(:execute)
      model.create_table
    end
  end
end
