class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    params.require(:task).permit(:description)
  end
end
