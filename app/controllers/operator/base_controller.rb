class Operator::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_operator_login

  layout 'operator/layouts/application'

  def check_operator_login
    unless current_user.operator?
      flash[:error] = I18n.t "error.not_login_operator"
      redirect_to root_path
    end
  end
end
