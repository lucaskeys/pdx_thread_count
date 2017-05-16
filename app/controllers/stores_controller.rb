class StoresController < ApplicationController
	def index
		@stores = Store.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def follow
		@user = current_user
		@store = Store.find(params[:id])
		@user.stores << @store
		redirect_to store_url
	end

	def unfollow
		@user = User.find(current_user)
		@store = Store.find(params[:id])
		@user_stores = @user.stores.where(user_id: @user.id, store_id: @store.id)
		redirect_to store_url
	end
end
