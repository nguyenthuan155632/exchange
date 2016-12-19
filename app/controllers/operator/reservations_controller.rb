class Operator::ReservationsController < Operator::BaseController

	def index
    @q = Reservation.where(:btc_jpy => true).order(created_at: :desc).ransack(params[:q])
    @reservations = @q.result(distinct: true).includes(:btc_address, :shop, :user).paginate(:page => params[:reservations_param], :per_page => 5)
  end

  def jpy_btc
    @q = Reservation.where(:btc_jpy => false).order(created_at: :desc).ransack(params[:q])
    @jpy_exchange = @q.result(distinct: true).includes(:btc_address, :shop, :user).paginate(:page => params[:jpy_exchange_param], :per_page => 5)
  end

  def update_status
  	reservation = Reservation.find(params[:reservation][:id])
    reservation.date_time_receipt = DateTime.now
    reservation.status = params[:reservation][:status]
  	if reservation.save
      flash[:success] = "Update status success!"
    else
      flash[:error] = "Update status failed!"
    end
    redirect_to :back
  end

end