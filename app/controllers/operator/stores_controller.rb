class Operator::StoresController < Operator::BaseController
  before_action :get_store, only: [:edit, :update, :destroy, :show]
  def index
    @stores = Shop.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @store = Shop.new
  end

  def show
  end

  def create
    @store = Shop.new(store_params)
    @store.save
    flash[:success] = "Create success!"
    redirect_to operator_stores_path
  end

  def edit
  end

  def update
    if @store.update(store_params)
      flash[:success] = "Update success!"
      redirect_to operator_stores_path
    else
      render "edit"
    end
  end

  def destroy
    @store.delete
    flash[:success] = "Delete success!"
    redirect_to operator_stores_path
  end

  private
  def get_store
    @store = Shop.find(params[:id])
  end
  def store_params
    params.require(:shop).permit(:name, :address, :phone, :deposit, :lat, :long)
  end
end
