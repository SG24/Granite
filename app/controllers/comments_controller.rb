class CommentsController < ApplicationController
  before_action :current_user
  before_action :fetch_task

  def create
    @comment = @task.comments.create(comment_params)
    @comment.user_id = current_user.id

    redirect_to @task if @comment.save
  end

  private

  def fetch_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
