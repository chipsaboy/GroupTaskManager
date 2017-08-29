class ListsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

  def index
    @lists = List.all
    @list = List.new
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
  	@tasks = @list.tasks
  	@task = Task.new
  end

  def update
  	if @list.update(list_params)
  		redirect_to @list
  	else
  		render :edit
  	end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def find_list
  	@list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
