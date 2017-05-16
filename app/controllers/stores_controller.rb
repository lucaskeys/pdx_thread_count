class StoresController < ApplicationController
	before_action :set_store, only: [:show, :edit, :update, :show, :destroy, :follow, :unfollow]
	access all: [:show, :index, :follow, :unfollow], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	def index
		@stores = Store.all
	end

	def show

	end

	def new
		@store = Store.new
	end

	def create
		@store = Store.new(store_params)
		respond_to do |format|
		if @store.save
			format.html { redirect_to store_path(@store), notice: "Store has been added" }
		else
			format.html { render :new}
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
		if @store.update(store_params)
			format.html { redirect_to store_path(@store), notice: "Store has been updated" }
		else
			format.html { render :edit}
			end
		end
	end

	def follow
		@user = current_user
		@user.stores << @store
		redirect_to store_url
	end

	def unfollow
		user = User.find(current_user)
		follower = user.stores.delete(Store.find(params[:id]))
		redirect_to store_url
	end

	def destroy
		@store.destroy
  			respond_to do |format|
  			format.html { redirect_to stores_path, notice: "Store was removed"}
    	end
	end

	private

	def store_params
		params.require(:store).permit(:store_name, 
										:store_description, 
										:store_bio,
										:main_image,
										:thumb_image,
										:address,
										:contact
										 )
	end

	def set_store 
		@store = Store.find(params[:id])
	end
end
