class TasksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      render @list, alert: @task.errors.full_messages
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :state, :due_date, :list_id, user_ids:[], tag_ids:[])
  end
end
