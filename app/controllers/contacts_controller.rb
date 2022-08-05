class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]

	def new
		@contact = Contact.new
	end

  def show
    @contacts = current_user.contacts.order(created_at: :desc)
  end

	def create
    @contact = current_user.contacts.build(contacts_params)
    if @contact.save
      flash[:success] = t(".contact_created")
      redirect_to contact_path(current_user)
    else
      flash[:danger] = t(".contact_no_create")
      render :new
    end
  end

  def edit
    if @contact.present?
      unless @contact.user.id == current_user.id
        flash[:danger] = t(".access")
        redirect_to contact_path
      end
    else
      flash[:danger] = t(".find_contact")
      redirect_to root_path
    end
  end

  def update
    if @contact.update(contacts_params)
      flash[:success] = t(".contact_update")
      redirect_to contact_path(current_user)
    else
      flash[:danger] = t(".contact_fail_update")
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = t(".contact_delete")
    redirect_to contact_path(current_user)
  end

	private

		def contacts_params
			params.require(:contact).permit(:contact_name, :phone, :address, :contact_type)
		end

    def find_contact
      @contact = Contact.find_by(id: params[:id])
      if @contact.nil?
        flash[:danger] = t(".contact_fail_find")
        redirect_to contact_path
      end
    end
end
