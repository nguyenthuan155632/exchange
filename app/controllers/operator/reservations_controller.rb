class Operator::ReservationsController < Operator::BaseController

	def index
		@q = Reservation.ransack(params[:q])
		@reservations = @q.result(distinct: true).includes(:btc_address, :shop, :user).paginate(:page => params[:page], :per_page => 5)
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