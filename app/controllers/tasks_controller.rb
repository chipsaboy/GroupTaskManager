class TasksController < ApplicationController
	before_action :find_list, except: [:my_tasks, :overdue, :complete_task, :completed, :destroy]
	before_action :find_task, only: [:edit, :update]

  def index
    @tasks = @list.tasks.incomplete
    respond_to do |f|
      f.html { list_path(@tasks) }
      f.json { render json: @tasks }
    end
  end

  def my_tasks
    @tasks = current_user.tasks.incomplete
  end

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.build(clean_params(task_params))
    if @task.save
      redirect_to list_path(@list), notice: "Task Successfully Created"
    else
      render :new, alert: @task.errors.full_messages
    end
  end

  def overdue
    user_tasks = current_user.tasks.incomplete
    @tasks = user_tasks.overdue_tasks
  end

  def edit
  end

  def update
    @task.update(clean_params(task_params))
    if @task.save
      redirect_to list_path(@list), notice: "Task Successfully Updated"
    else
      render :edit, alert: @task.errors.full_messages
    end
  end

  def complete_task
    @task = Task.find(params[:id])
    @task.state = 1
    @task.save
    redirect_to request.referrer, notice: "Task Completed"
  end

  def completed
    @tasks = current_user.tasks.completed
  end

  def destroy
    @task = Task.find(params[:id])
  	@task.destroy
  	redirect_to request.referrer, notice: "Task Deleted"
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

  def clean_params(_params)
    _params.delete_if do |k, v|
      if v.instance_of?(ActionController::Parameters)
        clean_params(v)
      end
      v.empty?
    end
  end

end
