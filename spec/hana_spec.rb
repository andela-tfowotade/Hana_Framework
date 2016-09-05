require 'spec_helper'
 
describe 'TodoApp' do
  include Rack::Test::Methods
 
  TodoApp = TodoApplication::Application.new
  def app
    require "../todo/config/routes.rb"
    TodoApp
  end
 
  it "returns a list of all my todos" do
    get '/todo_list'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("['Write a book', 'Build a house', 'Get married', 'Buy a car']")
  end
 
  it "returns first item in my todolist" do
    get '/todo_list/first'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Write a book")
  end
 
  it "can respond to post request" do
    post '/todo_list'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Post go swimming")
  end
 
  it "can respond to put request" do
    put '/todo_list'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Put Write a book")
  end
 
  it "can respond to delete request" do
    delete '/todo_list'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Delete Write a book")
  end
end
 
describe Hana do
  it 'has a version number' do
    expect(Hana::VERSION).not_to be nil
  end
end