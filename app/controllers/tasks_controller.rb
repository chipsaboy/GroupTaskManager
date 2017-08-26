class TasksController < ApplicationController
	before_action :find_list
	before_action :find_task, only: [:update, :destroy]

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), alert: @task.errors.full_messages
    end
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), alert: @task.errors.full_messages
    end
  end

  def destroy
  	@task.destroy
  	redirect_to list_path(@list)
  end

  private

  def find_task
  	@task = @list.tasks.find(params[:id])

  def find_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:name, :state, :due_date, :list_id, user_ids:[], tag_ids:[])
  end
end
