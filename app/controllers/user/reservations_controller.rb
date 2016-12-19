class User::ReservationsController < User::BaseController
  def new
    @btc_jpy = Setting.where(:key => "BTCJPY").first
  end

  def new_jpy_btc
    @btc_jpy = Setting.where(:key => "BTCJPY").first.value.to_f
  end

  def create_jpy_btc
    @reservation = current_user.reservations.new(jpy_btc_params)
    @reservation.btc_jpy = false
    @btc_jpy = Setting.where(:key => "BTCJPY").first.value
    @reservation.rate = (@btc_jpy.to_f + @btc_jpy.to_f * 10 / 100)
    @reservation.save
    flash[:success] = "JPY -> BTC Exchange success"

    redirect_to new_jpy_btc_user_reservations_path
  end

  def new_btc_address
  end

  def create_btc_address
    @btc_address = current_user.btc_addresses.new(btc_address_params)
    @btc_address.save

    flash[:success] = "Create BTC Address success"
    redirect_to new_jpy_btc_user_reservations_path
  end

  def create
    require 'uri'
    require 'net/http'
    require 'net/https'

    @btc_jpy = Setting.where(:key => "BTCJPY").first.value
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.btc_jpy = true
    @reservation.rate = (@btc_jpy.to_f + @btc_jpy.to_f * 10 / 100)
    

    uri = URI.parse("https://www.blockonomics.co/api/new_address")
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, { "Authorization" => "Bearer #{ENV["api_key"]}" })
    res = https.request(req)
    @new_address = JSON.parse(res.body)['address']
    @btc_address = BtcAddress.create(shop_id: params[:reservation][:shop_id], address: @new_address)

    @reservation.btc_address_id = @btc_address.id
    @reservation.save
    flash[:success] = "Reservation Exchange success"
  end

  def btc_value
    @btc_jpy = Setting.where(:key => "BTCJPY").first.value.to_f
    render text: (params['jpy_value'].to_f * (@btc_jpy.to_f + @btc_jpy.to_f * 10 / 100)).to_s
  end

  def jpy_value
    @btc_jpy = Setting.where(:key => "BTCJPY").first.value.to_f
    render text: (params['btc_value'].to_f / (@btc_jpy.to_f + @btc_jpy.to_f * 10 / 100)).to_s
  end

  def get_list
    @reservations = current_user.reservations.btc_jpy.includes(:shop, :btc_address)
    @jpy_btc = current_user.reservations.jpy_btc.includes(:btc_address)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:amout, :shop_id)
  end
  def jpy_btc_params
    params.require(:reservation).permit(:amout, :btc_address_id)
  end
  def btc_address_params
    params.require(:btc_address).permit(:address)
  end
end
