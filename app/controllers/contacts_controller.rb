class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy, :edit, :update]

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @application = Application.find(params[:application_id])
    if @contact.save!
      ContactApplication.new(contact: @contact, application: @application)
      redirect_to application_path(application)
    else
      render :new
    end
  end

  def edit
    authorize @contact
  end

  def update
    @contact.update(contact_params)
    redirect_to application_path(result)
    authorize @contact
  end

  def destroy
    @contact.destroy
    redirect_to application_path(result)
    authorize @contact
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :linkedin_url)
  end
end
