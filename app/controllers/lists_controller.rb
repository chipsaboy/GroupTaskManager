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
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: "List Successfully Created"
    else
      render :new, alert: @list.errors.full_messages
    end
  end

  def show
  	@tasks = @list.tasks
  	@task = Task.new
  end

  def edit
  end

  def update
  	if @list.update(list_params)
  		redirect_to @list, notice: "List Successfully Updated"
  	else
  		render :edit, alert: @list.errors.full_messages
  	end
  end

  def destroy
    if @list.user_id == current_user.id
      @list.destroy
      redirect_to lists_path, notice: "List Deleted"
    else
      redirect_to @list, alert: @list.errors.full_messages
    end
  end

  private

  def find_list
  	@list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
