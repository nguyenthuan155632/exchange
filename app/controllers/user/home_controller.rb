class User::HomeController < User::BaseController
	before_action :get_rates, only: [:index]

  def index
  end

  private
  	def get_rates
  		@btc_jpy = Setting.where(:key => "BTCJPY").first
  		@btc_usd = Setting.where(:key => "BTCUSD").first
  		@usd_jpy = Setting.where(:key => "USDJPY").first
  	end
end
