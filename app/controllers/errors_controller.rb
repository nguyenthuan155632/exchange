class ErrorsController < ApplicationController
  def routing
    flash[:error] = I18n.t "error.404_error"
    redirect_to root_path
  end
end
