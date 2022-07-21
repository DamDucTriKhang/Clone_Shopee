class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
    @contact = current_user.contacts.build(contacts_params)
    if @contact.save
      flash[:success] = t("controllers.contacts.create.contact_created")
      redirect_to contacts_path
    else
      flash[:danger] = t("controllers.contacts.create.contact_no_create")
      render :new
    end
  end

	private

		def contacts_params
			params.require(:contact).permit(:contact_name, :phone, :address, :contact_type)
		end
end
