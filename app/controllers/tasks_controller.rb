class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :state, :due_date, :list_id, user_ids:[], user_attributes: [:name], tag_ids:[], tags_attributes: [:name])
  end

end