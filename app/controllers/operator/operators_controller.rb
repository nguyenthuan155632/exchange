class Operator::OperatorsController < Operator::BaseController
  before_action :get_operator, only: [:show, :get_shop]
  def index
    @operators = Operator.all
  end

  def show
  end

  def get_shop
    @shops = @operator.shops
  end

  private
  def get_operator
    @operator = Operator.find(params[:id])
  end
end
