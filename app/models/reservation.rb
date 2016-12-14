class Reservation < ActiveRecord::Base
  scope :btc_jpy, -> { where(btc_jpy: true) }
  scope :jpy_btc, -> { where(btc_jpy: false) }

  belongs_to :user
  belongs_to :shop

  belongs_to :btc_address

  def get_status
    if self.status == 0
      "Receiving"
    elsif self.status == 1
      "Exchange completed"
    else
      "Not applicable"
    end 
  end
end
