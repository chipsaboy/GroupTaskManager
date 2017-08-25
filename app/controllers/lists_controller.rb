class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
  	@list = List.find(params[:id])
  	@task = Task.new
  end

  def destroy
    @list = List.find(params[:id])
    @task = Task.find_by(params[:id])
    @task.destroy
    redirect_to @list
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:list_id, :name, :description, :state, :due_date])
  end

end
