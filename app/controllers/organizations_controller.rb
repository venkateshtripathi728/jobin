class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:update, :destroy, :edit]
      
    def create
      @organization = Organization.new(organizations_params)
      @experience.save
      redirect_to profile_path
      authorize @experience
    end
    
    def update
      @apply = Apply.find(params[:apply_id])
      @organization.update(organizations_params)
      authorize @organization
      @apply.update(apply_params)
      redirect_to apply_path(@apply)
      authorize @apply
    end

    
  def edit
    @apply = Apply.find(params[:apply_id])
    authorize @organization
  end

      
    def createorfind
      @organization = Organization.where(:name => params[:name],:logo => params[:logo],:description => params[:domain]).first_or_create
      authorize @organization
    end

    def destroy
      @organization.destroy
      redirect_to profile_path
      authorize @organization
    end
      
    private
  
    def set_organization
      @organization = Organization.find(params[:id])
    end
      
    def organizations_params
      params.require(:organization).permit(:name, :description, :category)
    end

    
  def apply_params
    params.require(:organization).require(:apply).permit(:job_title, :description, :status, :progression_bar, :location, :ranking, :url, :organization_id, :finalstatus)
  end

end
