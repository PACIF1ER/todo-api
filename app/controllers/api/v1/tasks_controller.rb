class API::V1::TasksController < API::BaseController
  before_action :authenticate_request

  def index
    tasks = current_api_user.tasks.order("created_at ASC")
    render(
      json: tasks, status: 200
    )
  end

  def create
    task = current_api_user.tasks.create(task_params)

    if task.persisted?
      render(
        json: task, status: 200
      )
    else
      render(
        json: { message: "Error creating task." }, status: 422
      )
    end
  end

  def update
   task = Task.find(params[:id])
   task.update(task_params)
   render(
    json: task, satus: 200)
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    render(
        json: task, status: 200
      )
    end

 

  private

  def task_params
    params.require(:task).permit(:body, :completed, :alert_at, :id)
  end

  def _set_todo
    task = Task.find(params[:id])
  end

end
