class User::KycsController < User::BaseController
  before_action :get_kyc_paper, only: [:edit, :update]
  def index
  end

  def new
    @kyc_paper = KycPaper.new
  end

  def create
    @kyc_paper = KycPaper.new(kyc_params)
    @kyc_paper.user_id = current_user.id
    @kyc_paper.save
    redirect_to user_home_index_path
  end

  def edit
  end

  def update
    if @kyc_paper.update(update_kyc_params)
      flash[:success] = "Update KYC Paper success!"
      redirect_to user_user_path(current_user.id)
    else
      render "edit"
    end
  end

  private
  def get_kyc_paper
    @kyc_paper = KycPaper.find(params[:id])
  end
  def kyc_params
    params.require(:kyc_paper).permit(:passport_your_self, :passport, :address_front, :address_after, :driver_your_self, :driver_front, :driver_after, :utility_bill)
  end
   def update_kyc_params
    params.fetch(:kyc_paper, {}).permit(:passport_your_self, :passport, :address_front, :address_after, :driver_your_self, :driver_front, :driver_after, :utility_bill)
  end

end
