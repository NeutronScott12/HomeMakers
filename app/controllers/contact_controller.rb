class ContactController < ApplicationController

	before_action :find_contact, only: [:create, :edit, :update, :delete]

	def index
		@contacts = Contact.all.order("created_at DESC")
	end

	def show
	end

	def new
		@contact = current_user.contacts.build
	end

	def create
		@contact = current_user.contacts.build(contact_params)
		if @contact.save
			redirect_to @contact
		else
			render 'new'
		end 
	end

	def edit
	end

	def update
		if @contact.update(contact_params)
			redirect_to @contact
		else 
			render 'edit'
		end
	end

	def destroy
		@contact.destroy
		redirect_to @contact
	end

	private

	def find_contact
		@contact = Contact.find(params[:id])
	end

	def contact_params
		params.require(:contact).permit(:phone, :email, :website, :address)
	end

end
