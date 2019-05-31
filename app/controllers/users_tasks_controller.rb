class UsersTasksController < ApplicationController
  def update
    task = UsersTask.find(params.fetch(:id))
    task.update!(update_params)

    respond_to do |format|
      format.json do
        render json: {success: true}, status: 200
      end
    end
  end

  private

  def update_params
    params.require(:users_task).permit(:completed)
  end
end
