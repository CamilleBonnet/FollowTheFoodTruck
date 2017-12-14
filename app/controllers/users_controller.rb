class UsersController < ApplicationController
  before_action :set_current_user, only: [:orders_show, :edit]

  def show
    if params[:id] == 'myprofile'
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @user_truck = Truck.where(user_id: current_user.id)
  end

  def orders_show
  end

  def edit
  end

  def update
   current_user
   current_user.update(user_params)
   redirect_to myprofile_path
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
