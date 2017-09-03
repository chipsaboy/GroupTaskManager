class TasksController < ApplicationController
	before_action :find_list, except: [:index, :destroy]
	before_action :find_task, only: [:edit, :update]

  def index
    @tasks = current_user.tasks
  end

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list), notice: "Task Successfully Created"
    else
      redirect_to list_path(@list), alert: @task.errors.full_messages
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to list_path(@list), notice: "Task Successfully Updated"
    else
      redirect_to list_path(@list), alert: @task.errors.full_messages
    end
  end

  def destroy
    @task = Task.find(params[:id])
  	@task.destroy
  	redirect_to list_path(@task.list), notice: "Task Completed"
  end

  private

  def find_task
  	@task = @list.tasks.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:name, :state, :due_date, :list_id, :user_ids, users_attributes: [:name, :email], tag_ids:[], tags_attributes: [:name, :task_id])
  end
end
