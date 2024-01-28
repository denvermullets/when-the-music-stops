class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream
      end
    end
  end

  def update
    user = User.find(params[:user_id])
    if user.update(user_params)
      redirect_to user_show_path, locals: { user: }
    end
  end

  def show
    user = User.find_by('username ILIKE ?', params[:username])

    if user
      render :show, locals: { user: }
    else
      # opting to just redirect to root w/o a notice, not sure if i care or not
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :avatar, :display_location, :display_post_count, :location
    )
  end
end
