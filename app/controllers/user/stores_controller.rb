class User::StoresController < User::BaseController
	before_action :get_store, only: [:show]

	def show
		@stores = Shop.select(:id, :lat, :long).all.to_json
		puts @stores
	end

	private
		def get_store
			@store = Shop.find(params[:id])
		end
end