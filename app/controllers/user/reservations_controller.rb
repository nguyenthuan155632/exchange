class User::ReservationsController < User::BaseController
  def new
    @btc_jpy = Setting.where(:key => "BTCJPY").first
    # @usd_jpy = Setting.where(:key => "USDJPY").first
  end
end
