class Balance < ActiveRecord::Base
  scope :btc_jpy, -> { where(jpy_btc: false) }
  scope :jpy_btc, -> { where(jpy_btc: true) }

  belongs_to :shop
end
