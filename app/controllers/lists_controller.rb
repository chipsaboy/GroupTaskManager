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

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:name, :description, :state, :due_date])
  end

end
