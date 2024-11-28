class Admin::ActionsController < ApplicationController
  def delete_user
    DeleteUser::History.call(user_id: params[:user_id])

    redirect_to root_path
  end
end
