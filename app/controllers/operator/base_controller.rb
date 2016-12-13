class Operator::BaseController < ApplicationController
  before_action :authenticate_operator!

  layout 'operator/layouts/application'
end
