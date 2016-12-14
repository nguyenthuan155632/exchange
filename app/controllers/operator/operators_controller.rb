class Operator::OperatorsController < Operator::BaseController
  def index
    @operators = Operator.all
  end

  def show
  end

  def get_shop
  end

end
