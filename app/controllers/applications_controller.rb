class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show,:edit,:update,:destroy]

  def index
    @applications = policy_scope(Application).order(created_at: :desc)
    @application = Application.new
  end

  def show
    @interview = Interview.new
    authorize @interview
    @contact = Contact.new
    authorize @contact
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      redirect_to applications_path
    else
      render "applications/index"
    end
    authorize @application
  end

  def edit
    authorize @application
  end

  def update
    @application.update(application_params)
    redirect_to applications_path
    authorize @application
  end

  def destroy
    @application.destroy
    redirect_to applications_path
    authorize @application
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:job_title, :description, :status, :progression_bar, :location, :ranking, :url)
  end
end
