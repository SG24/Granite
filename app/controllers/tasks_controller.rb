class TasksController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @user = User.find(task_params[:assignee_id])
    @task = Task.new(task_params)
    @task.creator_id = @current_user.id
    if @task.valid?
      @task.save
      redirect_to task_url(@task)
    else
      render 'new' # Renders the new page when task is not saved to the DB.
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    redirect_to @task if @task.update_attributes(task_params)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:description, :assignee_id)
  end
end
