class Operator::UsersController < Operator::BaseController
  before_action :get_users, only: [:index]
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def update
    
  end

  def destroy
    @user.delete
    flash[:success] = "Delete success!"
    redirect_to operator_users_path
  end

  private
    def get_users
      @users = User.paginate(:page => params[:page], :per_page => 5)
    end

    def get_user
      @user = User.find(params[:id])
    end
    # def update_params
    #   params.require(:user).permit(:user_name, :email)
    # end
end
