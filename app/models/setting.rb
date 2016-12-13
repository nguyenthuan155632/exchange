class Setting < ActiveRecord::Base
	def self.update_rate
		require 'net/http'
		require 'json'
		url_btc = 'https://api.coinbase.com/v2/exchange-rates?currency=BTC'
		url_usd = 'https://api.coinbase.com/v2/exchange-rates?currency=USD'
		btc = JSON.parse(Net::HTTP.get(URI(url_btc)))
		usd = JSON.parse(Net::HTTP.get(URI(url_usd)))

		btc_jpy = Setting.where(:key => "BTCJPY").first
		check_rate btc_jpy, "BTCJPY", btc["data"]["rates"]["JPY"]

		btc_usd = Setting.where(:key => "BTCUSD").first
		check_rate btc_usd, "BTCUSD", btc["data"]["rates"]["USD"]

		usd_jpy = Setting.where(:key => "USDJPY").first
		check_rate usd_jpy, "USDJPY", usd["data"]["rates"]["JPY"]
	end

	def self.check_rate exchange, key, value
		if exchange
			exchange.update(:value => value)
		else
			Setting.new(:key => key, :value => value).save
		end
	end
end
	