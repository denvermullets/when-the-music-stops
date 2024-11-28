class Admin::ActionsController < ApplicationController
  def delete_user
    return if params[:user_id].to_i == current_user.id

    DeleteUser::History.call(user_id: params[:user_id])

    redirect_to root_path
  end
end
