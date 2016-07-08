class SpecialsController < ApplicationController
	
	before_action :find_special, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index 
		@specials = Special.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
	end

	def show
	end

	def new
		@special = current_user.specials.build
	end

	def create
		@special = current_user.specials.build(special_params)

		if @special.save
			flash[:notice] = "Special Offer Uploaded"
			redirect_to @special
		else
			flash[:notice] = "Please fill in all fields"
			render 'new'
		end
	end

	def edit
	end

	def update
		if @special.update(special_params)
			flash[:notice] = "Special offer updated"
			redirect_to @special
		else
			flash[:notice] = "Please fill in all fields"
			render 'edit'
		end
	end

	def destroy
		flash[:notice] = "Special offer deleted"
		@special.destroy
		redirect_to @special
	end

	private

	def find_special
		@special = Special.find(params[:id])
	end

	def special_params
		params.require(:special).permit(:title, :description, :price, :image)
	end
end
