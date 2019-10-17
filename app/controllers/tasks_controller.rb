class TasksController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @tasks = TaskPolicy::Scope.new(current_user, Task).resolve
    # @tasks = policy_scope(Task)
    # alternatively: @tasks = policy_scope(Task)
  end

  def new
    @task = Task.new
  end

  def create
    @user = User.find(task_params[:assignee_id])
    @task = Task.new(task_params)
    authorize @task
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
    authorize @task
    @comments = @task.comments
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task

    redirect_to @task if @task.update_attributes(task_params)
  end

  def destroy
    task = Task.find(params[:id])
    authorize @task
    task.destroy
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task)
          .permit(:description,
                  :assignee_id,
                  attachment_attributes: [avatars: []])
  end
end
