class Operator::AggregatesController < Operator::BaseController
  def index
    @btc_jpy = Setting.where(:key => "BTCJPY").first
    @btc_usd = Setting.where(:key => "BTCUSD").first
    @usd_jpy = Setting.where(:key => "USDJPY").first
    @rate_percent = Setting.where(key: "rate_percent").first
    @shop = Shop.all
    @percent = Setting.where(key: "amount_percent").first.value
    @total = Shop.total_balance
    @number_transactions = Shop.number_transactions
    @balance = @total.to_f - @total.to_f * 10 / 100
    @shop_amount = @balance.to_f * @percent.split(":").first.to_f / 10
    @admin_amount = @balance.to_f * @percent.split(":").last.to_f / 10
  end

  def update_rate
    Setting.where(key: "rate_percent").first.update(value: params[:rate])
    flash[:success] = "Update rate percent success!"
    redirect_to operator_aggregates_path
  end

  def update_percent
    Setting.where(key: "amount_percent").first.update(value: "#{params[:shop]}:#{params[:admin]}")
    flash[:success] = "Update percent success!"
    redirect_to operator_aggregates_path
  end
end
