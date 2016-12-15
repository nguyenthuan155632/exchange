class Shop < ActiveRecord::Base
  has_many :balances
  has_many :reservations
  has_many :btc_addresses

  def self.total_balance
    total = 0
    Shop.all.each do |s|
      total += (s.balances.jpy_btc.sum(:amount) - s.balances.btc_jpy.sum(:amount))
    end
    total
  end
  def self.number_transactions
    total = 0
    Shop.all.each do |s|
      total += s.balances.count
    end
    total
  end
end
