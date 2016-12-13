class User::KycsController < User::BaseController
  def index
  end

  def new
  end

  def create
    @kyc_paper = KycPaper.new(kyc_params)
    @kyc_paper.user_id = current_user.id
    @kyc_paper.valid?
    p @kyc_paper.errors
    @kyc_paper.save
    redirect_to user_home_index_path
  end

  private
  def kyc_params
    params.require(:kyc_paper).permit(:passport_your_self, :passport, :address_front, :address_after, :driver_your_self, :driver_front, :driver_after, :utility_bill)
  end

end
