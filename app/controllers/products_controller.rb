class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy]
	before_action :find_item_id, only: [:create, :edit, :update, :destroy]
	before_action :authenticate_user!

	def create 
		@product = @item.products.create(product_params)
		@product.user_id = current_user.id
		@product.save 

		if @product.save
			flash[:notice] = "Product uploaded"
			redirect_to item_path(@item)
		else 
			flash[:notice] = "Please fill in all fields"
			render 'new'
		end
	end

	def edit
		@product = @item.products.find(params[:id])
	end

	def update 
		@product = @item.products.find(params[:id])

		if @product.update(product_params)
			flash[:notice] = "Updated product"
			redirect_to item_path(@item)
		else 
			flash[:notice] = "Please fill in all fields"
			render 'edit'
		end
	end

	def destroy
		flash[:notice] = "Product deleted"
		@product = @item.products.find(params[:id])
		@product.destroy
		redirect_to root_path
	end

	private

	def find_item_id
		@item = Item.find(params[:item_id])
	end

	def find_product 
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :price, :stock, :image)
	end
end
