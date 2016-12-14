class Shop < ActiveRecord::Base
  has_many :reservations
  has_many :btc_addresses
end
