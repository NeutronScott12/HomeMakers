class ItemsController < ApplicationController

	before_action :find_item, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		@products = Product.where(item_id: @item)
	end

	def new
		@item = current_user.items.build
	end

	def create
		@item = current_user.items.build(params_item)
		if @item.save 
			flash[:notice] = "Category created"
			redirect_to root_path
		else 
			flash[:notice] = "Please Enter all fields"
			render 'new'
		end
	end

	def edit
	end

	def update
		if @item.update(params_item)
			flash[:notice] = "Category Changed"
			redirect_to root_path
		else 
			flash[:alert] = "Make sure to compete all sections"
			render 'edit'
		end
	end

	def destroy
		flash[:notice] = "Category deleted"
		@item.destroy
		redirect_to root_path
	end

	private

	def find_item
		@item = Item.find(params[:id])
	end

	def params_item
		params.require(:item).permit(:title, :image)
	end

end
