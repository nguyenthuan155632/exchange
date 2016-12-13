class KycPaper < ActiveRecord::Base
  mount_uploader :passport_your_self, KycUploader
  mount_uploader :passport, KycUploader
  mount_uploader :address_front, KycUploader
  mount_uploader :address_after, KycUploader
  mount_uploader :driver_your_self, KycUploader
  mount_uploader :driver_front, KycUploader
  mount_uploader :driver_after, KycUploader
  mount_uploader :utility_bill, KycUploader

  belongs_to :user

  validates :status, :inclusion=> { :in => [0,1,2] }

  # status: {pending: 0, confirmed: 1, rejected: 2}

end
