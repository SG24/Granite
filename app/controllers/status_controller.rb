class StatusController < ApplicationController
  def update
    @task = Task.find(params[:id])
    @task.state = params[:state]
    if @task.save
      respond_to do |format|
        format.js { render 'update' }
      end
    end
  end
end
