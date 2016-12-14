class Operator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:user_name]

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def get_admin
    if self.admin
      "Admin"
    else
      "Shop"
    end
  end

end
