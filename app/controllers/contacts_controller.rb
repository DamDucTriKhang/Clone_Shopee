class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update]

	def new
		@contact = Contact.new
	end

  def index
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

  def edit
    if @contact.present?
      unless @contact.user.id == current_user.id
        flash[:danger] = t("controllers.contacts.edit.access")
        redirect_to contacts_path
      end
    else
      flash[:danger] = t("controllers.contacts.edit.find_contact")
      redirect_to root_path
    end
  end

  def update
    if @contact.update(contacts_params)
      flash[:success] = t("controllers.contacts.update.contact_update")
      redirect_to contacts_path
    else
      flash[:danger] = t("controllers.contacts.update.contact_fail_update")
      render :edit
    end
  end

	private

		def contacts_params
			params.require(:contact).permit(:contact_name, :phone, :address, :contact_type)
		end

    def find_contact
      @contact = Contact.find_by(id: params[:id])
    end
end
