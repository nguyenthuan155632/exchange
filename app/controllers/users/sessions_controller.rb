class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.operator?
      operator_home_index_path
    else
      user_home_index_path
    end
  end
end
