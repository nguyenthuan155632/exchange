class User::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_login
  
  layout 'user/layouts/application'

  def check_user_login
    if current_user.operator?
      flash[:error] = I18n.t "error.not_login_user"
      redirect_to root_path
    end
  end
end
