class TodoController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params["id"])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      @todos = Todo.all
      redirect_to "/todo/#{@todo.id}/show"
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params["id"])
  end

  def update
    @todo = Todo.find(params["id"])
    if @todo.update(todo_params)
      redirect_to "/todo/#{@todo.id}/show"
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params["id"])
    @todo.destroy
    redirect_to "/"
  end

  private

  def todo_params
    {
      title: params["title"],
      body: params["body"]
    }
  end
end
