require "spec_helper"

RSpec.describe "Todo App", type: :feature do
  scenario "when visiting the homepage" do
    todos = create_list(:todo, 3)
    visit "/"

    expect(page).to have_content(todos[0].title)
    expect(page).to have_content(todos[1].title)
    expect(page).to have_content(todos[2].title)
    Todo.destroy_all
  end

  scenario "when creating new todo" do
    visit "/todo/new"

    expect(page).to have_content("Create New Todo")
  end

  scenario "when creating new todo with data" do
    visit "/todo/new"

    fill_in("title", with: "Holiday")
    fill_in("body", with: "Take a trip to Barbados")
    click_button("Create New")
    expect(page).to have_content("Holiday")
    Todo.destroy_all
  end

  scenario "when editing a todo" do
    todo = create(:todo)

    visit "/todo/#{todo.id}/edit"

    expect(page).to have_content("Update Todo")
    Todo.destroy_all
  end

  scenario "when updating todo with data" do
    todo = create(:todo)

    visit "/todo/#{todo.id}/edit"

    fill_in("title", with: "Holiday")
    fill_in("body", with: "Take a trip to Barbados")
    click_button("Update Todo")
    expect(page).to have_content("Holiday")
    Todo.destroy_all
  end

  scenario "when deleting a todo" do
    create(:todo)

    visit "/"
    find("#delete_button").click
    expect(current_path).to eq "/"
    Todo.destroy_all
  end

  scenario "when viewing a todo" do
    todo = create(:todo)

    visit "/todo/#{todo.id}/show"

    expect(page).to have_content(todo.title)
    expect(page).to have_content(todo.body)
    expect(page).to have_content(todo.status)

    expect(page).to have_content("Edit")
    Todo.destroy_all
  end

  scenario "when route is invalid" do
    visit "/invalid_route"
    expect(page).to have_content("Route not found")
  end
end
