class Operator::KycsController < Operator::BaseController
  
  before_action :get_kyc_paper, only: [:edit, :update, :confirm]

  def index
  end

  def edit
  end

  def update
    if @kyc_paper.update(update_kyc_params)
      flash[:success] = "Update KYC Paper success!"
      redirect_to operator_user_path(@kyc_paper.user)
    else
      render "edit"
    end
  end

  def confirm 
  	if @kyc_paper.status == 0
  		@kyc_paper.update(status: 1)
  		redirect_to edit_operator_kyc_path(@kyc_paper)
  	else
  		@kyc_paper.update(status: 0)
  		redirect_to edit_operator_kyc_path(@kyc_paper)
  	end
  end

  private
  def get_kyc_paper
    @kyc_paper = KycPaper.find(params[:id])
  end
  def update_kyc_params
    params.fetch(:kyc_paper, {}).permit(:passport_your_self, :passport, :address_front, :address_after, :driver_your_self, :driver_front, :driver_after, :utility_bill)
  end
    
end
