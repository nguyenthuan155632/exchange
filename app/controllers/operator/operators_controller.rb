class Operator::OperatorsController < Operator::BaseController
  def index
    @operators = Operator.all
  end
end
