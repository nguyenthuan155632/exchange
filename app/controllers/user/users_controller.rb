class User::UsersController < User::BaseController
  before_action :get_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(update_params)
      flash[:success] = "Update profile success!"
      redirect_to user_user_path(@user.id)
    else
      render "edit"
    end
  end

  private
  def get_user
    @user = User.find(current_user.id)
  end
  def update_params
    params.require(:user).permit(:user_name, :email)
  end
end
