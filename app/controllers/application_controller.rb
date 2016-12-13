class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    begin
      I18n.locale = params[:locale] || I18n.default_locale
    rescue
      flash[:error] = I18n.t "error.404_error"
      redirect_to root_path
    end
  end
  def default_url_options
    { locale: I18n.locale }
  end
end
