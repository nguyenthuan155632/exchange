class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.operator?
      operator_home_index_path
    else
      if resource.kyc_paper
        user_home_index_path
      else
        new_user_kyc_path
      end
    end
  end
end
