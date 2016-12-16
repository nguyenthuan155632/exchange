class Operator::ReservationsController < Operator::BaseController

	def index
    @a = Reservation.where(:btc_jpy => false).ransack(params[:a])
    @q = Reservation.where(:btc_jpy => true).ransack(params[:q])
    @reservations = @q.result(distinct: true).includes(:btc_address, :shop, :user).paginate(:page => params[:reservations_param], :per_page => 5)
    @jpy_exchange = @a.result(distinct: true).includes(:btc_address, :shop, :user).paginate(:page => params[:jpy_exchange_param], :per_page => 5)
  end

  def update_status
  	reservation = Reservation.find(params[:reservation][:id])
  	if reservation.update(update_params)
      flash[:success] = "Update status success!"
      redirect_to operator_reservations_path
    else
      flash[:error] = "Update status failed!"
      redirect_to operator_reservations_path
    end
  end

  private
  def update_params
    params.require(:reservation).permit(:status)
  end

end