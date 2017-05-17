class TodosController < ApplicationController
  before_action :set_todos

  # GET /todos
  def index
    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todos, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todos
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    render json: @todos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todos
      if params[:id]
        @todo = Todo.find(params[:id])
      end
      @todos = Todo.all
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:body, :completed)
    end
end
