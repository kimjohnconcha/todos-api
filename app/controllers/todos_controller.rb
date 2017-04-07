class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    #json_response(@todos)
    
    todo_arr = []
    @todos.each do |todo| 
      items_arr = []

      items = todo.items
      items.each do |item|
        items_arr.push({
          id: item.id,
          name: item.name,
          done: item.done
          })
      end

      todo_arr.push({
        id: todo.id,
        title: todo.title,
        items: items_arr
        })
    end 

    render json: {todo: todo_arr,status: 200}
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end