class Shop < ActiveRecord::Base
  belongs_to :operator

  has_many :reservations
  has_many :btc_addresses
end
