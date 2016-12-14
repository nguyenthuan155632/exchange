class User::StoresController < User::BaseController
	before_action :get_stores, only: [:index]

	def index
	end

	private
		def get_stores
			@stores = Shop.all.to_json
		end
end